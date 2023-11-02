import 'package:firebase_auth/firebase_auth.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

abstract interface class _FirebaseAuthService {
  Future<String?> signInWithEmailAndPassword(String email, String password);

  Future<String?> createUserWithEmailAndPassword(String email, String password);

  String? tryToSingIn();

  Future<void> signOut();

  bool get isSignedIn;
}

class FirebaseAuthService with ApiLoggy implements _FirebaseAuthService {
  FirebaseAuthService();

  final _auth = FirebaseAuth.instance;

  @override
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.email;
    } on FirebaseAuthException catch (e, s) {
      loggy.error(e, s);
      rethrow;
    } catch (e, s) {
      loggy.error(e, s);
      rethrow;
    }
  }

  @override
  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.email;
    } on FirebaseAuthException catch (e, s) {
      loggy.error(e, s);
      rethrow;
    } catch (e, s) {
      loggy.error(e, s);
      rethrow;
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
    } on FirebaseAuthException catch (e, s) {
      loggy.error(e, s);
      rethrow;
    } catch (e, s) {
      loggy.error(e, s);
      rethrow;
    }
  }

  @override
  bool get isSignedIn {
    final user = _auth.currentUser;
    return user != null;
  }
}
