import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/auth/firebase_auth_service.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';
import 'package:scalable_flutter_app_starter/feature/auth/data/auth_repository.dart';
import 'package:scalable_flutter_app_starter/feature/user/provider/user_mock_provider.dart';
import 'package:scalable_flutter_app_starter/feature/user/repository/user_repository.dart';

import '../../feature/auth/logic/bloc/auth_bloc.dart';
import '../../feature/user/bloc/user_cubit.dart';

class DI extends StatelessWidget {
  const DI({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _ApiDI(
      child: _RepositoryDI(
        child: _BlocDI(
          child: child,
        ),
      ),
    );
  }
}

class _ApiDI extends StatelessWidget {
  const _ApiDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserMockApi>(
          create: (context) => UserMockApi(),
        ),
      ],
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalStorageService>(
          create: (context) => LocalStorageService(),
        ),
        RepositoryProvider<FirebaseAuthService>(
          create: (context) => FirebaseAuthService(
            context.read<LocalStorageService>(),
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            userProvider: context.read<UserMockApi>(),
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            context.read<LocalStorageService>(),
            context.read<FirebaseAuthService>(),
          )..add(const AppStarted()),
        ),
      ],
      child: child,
    );
  }
}

class AuthorizedRouterDI extends StatelessWidget {
  const AuthorizedRouterDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(
        userEmail: context.read<AuthBloc>().state.user,
      ),
      child: child,
    );
  }
}

class UnauthorizedRouterDI extends StatelessWidget {
  const UnauthorizedRouterDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
