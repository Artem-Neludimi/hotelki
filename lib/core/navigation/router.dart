import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter_app_starter/core/navigation/route.dart';
import 'package:scalable_flutter_app_starter/feature/auth/ui/page/auth_page.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/ui/page/creating_hotelka.dart';
import 'package:scalable_flutter_app_starter/feature/splash/splash_page.dart';
import 'package:scalable_flutter_app_starter/feature/home/ui/page/home_page.dart';
import 'package:scalable_flutter_app_starter/feature/profile/ui/page/profile_page.dart';
import 'package:scalable_flutter_app_starter/feature/settings/ui/page/settings_page.dart';

import '../../feature/partner_settings/ui/page/partner_settings_page.dart';
import '../app/providers.dart';

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
      builder: (context, state, child) => UnauthorizedRouterProvider(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _unauthorizedRouterKey,
          path: AppRoute.auth.path,
          builder: (context, state) => const AuthPage(),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _authorizedRouterKey,
      builder: (context, state, child) => AuthorizedRouterProvider(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.home.path,
          builder: (context, state) => const HomeProvider(child: HomePage()),
        ),
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.settings.path,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          parentNavigatorKey: _authorizedRouterKey,
          path: AppRoute.profile.path,
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.creatingHotelka.path,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return CreatingHotelkaProvider(
          child: CreatingHotelkaPage(categoriesString: data['categories'] as List<String>),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.partnerSettings.path,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;
        return PartnerSettingsProvider(
          child: PartnerSettingsPage(linkEmail: data == null ? null : data['linkEmail'] as String?),
        );
      },
    ),
  ],
);
