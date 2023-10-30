import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/feature/auth/repository/auth_repository.dart';
import 'package:scalable_flutter_app_starter/feature/user/model/user.dart';
import 'package:scalable_flutter_app_starter/feature/user/repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocLoggy {
  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthInitial()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        SignUpWithEmailAndPassword() => _onSignUpWithEmailAndPassword(event, emit),
        SignInWithEmailAndPassword() => _signInWithEmailAndPassword(event, emit),
      },
    );
  }

  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await authRepository.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(AuthSuccess(user: user));
    } catch (e, s) {
      loggy.error('signUpWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _signInWithEmailAndPassword(SignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final user = await authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(AuthSuccess(user: user));
    } catch (e, s) {
      loggy.error('signInWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
