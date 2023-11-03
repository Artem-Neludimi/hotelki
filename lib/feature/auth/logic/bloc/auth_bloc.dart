import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/feature/auth/data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocLoggy {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthInitial()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        AppStarted() => _onAppStarted(event, emit),
        SignUpWithEmailAndPassword() => _onSignUpWithEmailAndPassword(event, emit),
        SignInWithEmailAndPassword() => _signInWithEmailAndPassword(event, emit),
        LogOut() => _onLogOut(event, emit),
      },
    );
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final user = await _authRepository.tryToSignIn();
      loggy.info('user: $user');
      if (user == null) {
        emit(const AuthUnauthorize());
      } else {
        emit(AuthAuthorize(user: user));
      }
    } catch (e, s) {
      loggy.error('appStarted error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await _authRepository.createUserWithEmailAndPassword(event.email, event.password);
      loggy.info('user: $user');
      emit(AuthAuthorize(user: user!));
    } catch (e, s) {
      loggy.error('signUpWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _signInWithEmailAndPassword(SignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(event.email, event.password);
      loggy.info('user: $user');
      emit(AuthAuthorize(user: user!));
    } catch (e, s) {
      loggy.error('signInWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogOut(LogOut event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      _authRepository.signOut();
      emit(const AuthInitial());
    } catch (e, s) {
      loggy.error('logOut error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
