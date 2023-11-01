import 'package:firebase_auth/firebase_auth.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

import '../../storage/local_storage_service.dart';

abstract interface class _FirebaseAuthService {
  Future<String?> signInWithEmailAndPassword({required String email, required String password});

  Future<String?> createUserWithEmailAndPassword({required String email, required String password});

  Future<String?> signInWithToken();

  Future<void> signOut();

  bool get isSignedIn;
}

class FirebaseAuthService with ApiLoggy implements _FirebaseAuthService {
  final LocalStorageService _localStorageService;

  FirebaseAuthService(this._localStorageService);

  final _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<String?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.email;
    } catch (e, s) {
      loggy.error(e, s);
      return null;
    }
  }

  @override
  Future<String?> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _localStorageService.saveToken(userCredential.credential!.token!);
      return userCredential.user?.email;
    } catch (e, s) {
      loggy.error(e, s);
      return null;
    }
  }

  @override
  Future<String?> signInWithToken() async {
    final token = _localStorageService.getToken;
    if (token == null) return null;
    try {
      final userCredential = await _auth.signInWithCustomToken(token as String);
      return userCredential.user?.email;
    } catch (e, s) {
      loggy.error(e, s);
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _localStorageService.clearToken();
    } catch (e, s) {
      loggy.error(e, s);
    }
  }

  @override
  bool get isSignedIn {
    final user = _auth.currentUser;
    return user != null;
  }
}
