import 'package:firebase_auth/firebase_auth.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

abstract interface class _FirebaseAuthService {
  Future<String?> signInWithEmailAndPassword({required String email, required String password});

  Future<String?> createUserWithEmailAndPassword({required String email, required String password});

  String? tryToSingIn();

  Future<void> signOut();

  bool get isSignedIn;
}

class FirebaseAuthService with ApiLoggy implements _FirebaseAuthService {
  FirebaseAuthService();

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
      return userCredential.user?.email;
    } catch (e, s) {
      loggy.error(e, s);
      return null;
    }
  }

  @override
  String? tryToSingIn() {
    final user = _auth.currentUser;
    return user?.email;
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
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
