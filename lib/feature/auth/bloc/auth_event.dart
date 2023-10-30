part of 'auth_bloc.dart';

sealed class AuthEvent {
  AuthEvent();
}

class SignUpWithEmailAndPassword extends AuthEvent {
  SignUpWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
class SignInWithEmailAndPassword extends AuthEvent {
  SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}