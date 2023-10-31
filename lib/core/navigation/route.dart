import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash('/'),
  auth('/auth'),
  home('/home'),
  settings('/settings'),
  account('/account'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context) => context.go(path);

  Future<T?> push<T>(BuildContext context) => context.push<T>(path);
}
