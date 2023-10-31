import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/feature/auth/bloc/auth_bloc.dart';
import 'package:scalable_flutter_app_starter/feature/auth/repository/auth_repository.dart';
import 'package:scalable_flutter_app_starter/feature/user/provider/user_mock_provider.dart';
import 'package:scalable_flutter_app_starter/feature/user/repository/user_repository.dart';

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
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            userProvider: context.read<UserMockApi>(),
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            userProvider: context.read<UserMockApi>(),
          ),
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
            userRepository: context.read<UserRepository>(),
            authRepository: context.read<AuthRepository>(),
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
        user: context.read<AuthBloc>().state.user,
      ),
      child: child,
    );
  }
}
