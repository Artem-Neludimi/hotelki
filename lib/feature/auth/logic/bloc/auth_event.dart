part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  const AppStarted();
}

class SignUpWithEmailAndPassword extends AuthEvent {
  const SignUpWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class SignInWithEmailAndPassword extends AuthEvent {
  const SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LogOut extends AuthEvent {
  const LogOut();
}
