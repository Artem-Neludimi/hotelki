import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/extension/context.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';

import '../auth/logic/bloc/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _onAuthState,
      child: Scaffold(
        body: Center(
          child: Text(
            'Scalable\nFlutter\nApp',
            textAlign: TextAlign.center,
            style: context.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }

  void _onAuthState(BuildContext context, AuthState authState) async {
    if (authState is AuthLoading) return;

    if (authState is AuthAuthorize) AppRoute.home.go(context);
    if (authState is AuthUnauthorize) AppRoute.auth.go(context);
  }
}
