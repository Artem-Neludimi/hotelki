import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scalable_flutter_app_starter/feature/creating_hotelka/logic/creating_hotelka_notifier.dart';
import 'package:scalable_flutter_app_starter/feature/home/logic/bloc/home_bloc.dart';
import 'package:scalable_flutter_app_starter/feature/partner_settings/logic/bloc/partner_settings_bloc.dart';

import '../../feature/home/data/home_respository.dart';
import '../../feature/partner_settings/data/partner_settings_repository.dart';

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
      create: (context) => HomeBloc(
        context.read<HomeRepository>(),
      ),
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
    return BlocProvider(
      create: (context) => PartnerSettingsBloc(
        context.read<PartnerSettingsRepository>(),
      ),
      child: child,
    );
  }
}
