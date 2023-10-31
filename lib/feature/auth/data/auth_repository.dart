import 'package:scalable_flutter_app_starter/core/services/firebase/auth/firebase_auth_service.dart';

abstract interface class _AuthRepository {
  Future<String?> createWithEmailAndPassword({required String email, required String password});

  Future<String?> signInWithEmailAndPassword({required String email, required String password});

  Future<String?> signInWithToken();

  Future<void> signOut();
}

interface class AuthRepository implements _AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  @override
  Future<String?> createWithEmailAndPassword({required String email, required String password}) async {
    final authEmail = await _firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
    return authEmail;
  }

  @override
  Future<String?> signInWithEmailAndPassword({required String email, required String password}) async {
    final authEmail = await _firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
    return authEmail;
  }

  @override
  Future<String?> signInWithToken() {
    return _firebaseAuthService.signInWithToken();
  }

  @override
  Future<void> signOut() {
    return _firebaseAuthService.signOut();
  }
}
