part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final User? user;
  const AuthState(this.user);
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(null);
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(null);
}

class AuthAuthorize extends AuthState {
  const AuthAuthorize({required User? user}) : super(user);
}

class AuthUnauthorize extends AuthState {
  const AuthUnauthorize() : super(null);
}

class AuthFailure extends AuthState {
  const AuthFailure({required this.errorMessage}) : super(null);

  final String errorMessage;
}
