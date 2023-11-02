import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

import '../../../core/services/api/model/user/user_model.dart';
import '../../../core/services/firebase/auth/firebase_auth_service.dart';
import '../../../core/services/firebase/firestore/firebase_firestore_service.dart';

abstract interface class _AuthRepository {
  Future<UserModel?> tryToSignIn();

  Future<UserModel?> getCurrentUser(String email);

  Future<UserModel?> createUserWithEmailAndPassword(String email, String password);

  Future<UserModel?> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

interface class AuthRepository with RepositoryLoggy implements _AuthRepository {
  AuthRepository(this._firebaseFirestoreService, this._firebaseAuthService);

  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseAuthService _firebaseAuthService;

  @override
  Future<UserModel?> tryToSignIn() async {
    final email = _firebaseAuthService.tryToSingIn();
    if (email == null) {
      return null;
    }
    return _firebaseFirestoreService.getUserByEmail(email);
  }

  @override
  Future<UserModel?> getCurrentUser(String email) async {
    return _firebaseFirestoreService.getUserByEmail(email);
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async {
    final userEmail = await _firebaseAuthService.createUserWithEmailAndPassword(email, password);
    if (userEmail == null) {
      return null;
    }final user = await _firebaseFirestoreService.createUser(userEmail);

    return user;
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    final userEmail = await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    if (userEmail == null) {
      return null;
    }
    return _firebaseFirestoreService.getUserByEmail(userEmail);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }
}
