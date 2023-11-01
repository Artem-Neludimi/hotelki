import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';

import '../../../../core/services/firebase/auth/firebase_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocLoggy {
  final LocalStorageService _localStorageService;
  final FirebaseAuthService _firebaseAuthService;

  AuthBloc(this._localStorageService, this._firebaseAuthService) : super(const AuthInitial()) {
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
    await _localStorageService.init();

    emit(const AuthLoading());

    try {
      const String? userEmail = null;

      if (userEmail == null) {
        emit(const AuthUnauthorize());
      } else {
        emit(const AuthAuthorize(authEmail: userEmail));
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
      final userEmail = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(AuthAuthorize(authEmail: userEmail!));
    } catch (e, s) {
      loggy.error('signUpWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _signInWithEmailAndPassword(SignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final user = await _firebaseAuthService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(AuthAuthorize(authEmail: user!));
    } catch (e, s) {
      loggy.error('signInWithEmailAndPassword error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onLogOut(LogOut event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      _firebaseAuthService.signOut();
      emit(const AuthInitial());
    } catch (e, s) {
      loggy.error('logOut error', e, s);
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
