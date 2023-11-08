import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash('/'),
  auth('/auth'),
  home('/home'),
  settings('/settings'),
  profile('/profile'),
  creatingHotelka('/creating-hotelka'),
  partnerSettings('/partner-settings'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {extra}) => context.go(path, extra: extra);

  Future<T?> push<T>(BuildContext context, {extra}) => context.push<T>(path, extra: extra);
}
