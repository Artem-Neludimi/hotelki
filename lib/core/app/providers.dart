import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/logic/creating_hotelka_notifier.dart';
import 'package:scalable_flutter_app_starter/feature/home/logic/bloc/home_bloc.dart';

class AuthorizedRouterProvider extends StatelessWidget {
  const AuthorizedRouterProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class UnauthorizedRouterProvider extends StatelessWidget {
  const UnauthorizedRouterProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: child,
    );
  }
}

class CreatingHotelkaProvider extends StatelessWidget {
  const CreatingHotelkaProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatingHotelkaNotifier(),
      child: child,
    );
  }
}
class PartnerSettingsProvider extends StatelessWidget {
  const PartnerSettingsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
