import 'package:firebase_auth/firebase_auth.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

import '../../storage/local_storage_service.dart';

abstract interface class _FirebaseAuthService {
  Future<void> signInWithEmailAndPassword();

  Future<void> signOut();

  bool get isSignedIn;
}

class FirebaseAuthService with ApiLoggy implements _FirebaseAuthService {
  final LocalStorageService localStorageService;

  FirebaseAuthService(this.localStorageService);
  @override
  Future<void> signInWithEmailAndPassword() async {
    try {
      if (isSignedIn) {
        loggy.info({
          'message': 'User already signed in',
        });
        return;
      }
      final credentials = await FirebaseAuth.instance.signInAnonymously();
      final user = credentials.user;
      loggy.info({
        'uid': user?.uid,
        'isAnonymous': user?.isAnonymous,
        'phoneNumber': user?.phoneNumber,
      });
    } catch (e, s) {
      loggy.error(e, s);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e, s) {
      loggy.error(e, s);
    }
  }

  @override
  bool get isSignedIn {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
