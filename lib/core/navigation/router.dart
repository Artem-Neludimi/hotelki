import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';
import 'package:scalable_flutter_app_starter/feature/auth/ui/page/auth_page.dart';
import 'package:scalable_flutter_app_starter/feature/auth/ui/page/splash_page.dart';
import 'package:scalable_flutter_app_starter/feature/home/ui/page/home_page.dart';
import 'package:scalable_flutter_app_starter/feature/settings/ui/page/settings_page.dart';

import '../app/di.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _unauthorizedRouterKey = GlobalKey<NavigatorState>();
final _authorizedRouterKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _routerKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashPage(),
    ),
    ShellRoute(
      navigatorKey: _unauthorizedRouterKey,
      routes: [
        GoRoute(
          parentNavigatorKey: _unauthorizedRouterKey,
          path: AppRoute.auth.path,
          builder: (context, state) => const AccountPage(),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _authorizedRouterKey,
      builder: (context, state, child) => AuthorizedRouterDI(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.settings.path,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.account.path,
          builder: (context, state) => const AccountPage(),
        ),
      ],
    ),
  ],
);
