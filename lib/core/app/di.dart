import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scalable_flutter_app_starter/core/localization/app_localization.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/auth/firebase_auth_service.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';
import 'package:scalable_flutter_app_starter/feature/auth/data/auth_repository.dart';
import 'package:scalable_flutter_app_starter/feature/user/provider/user_mock_provider.dart';
import 'package:scalable_flutter_app_starter/feature/user/repository/user_repository.dart';

import '../../feature/auth/logic/bloc/auth_bloc.dart';

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
          create: (context) => localStorageService,
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
        ChangeNotifierProvider(
          create: (context) => AppLocalization(
            context.read<LocalStorageService>(),
          ),
        ),
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

