import 'package:scalable_flutter_app_starter/feature/user/model/user.dart';
import 'package:scalable_flutter_app_starter/feature/user/provider/user_mock_provider.dart';

abstract interface class _AuthRepository {
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

interface class AuthRepository implements _AuthRepository {
  AuthRepository({required this.userProvider});

  final UserMockApi userProvider;

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await userProvider.triggerLoggedIn();
  }

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await userProvider.triggerLoggedIn();
  }
}
