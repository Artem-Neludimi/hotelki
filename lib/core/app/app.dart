import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/app/di.dart';
import 'package:scalable_flutter_app_starter/core/app/style.dart';
import 'package:scalable_flutter_app_starter/core/navigation/router.dart';

import '../localization/app_localization.dart';

class ScalableFlutterApp extends StatelessWidget {
  const ScalableFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DI(
      child: Builder(builder: (context) {
        final localization = context.watch<AppLocalization>();

        return MaterialApp.router(
          title: 'Scalable Flutter App',
          // localization
          locale: localization.locale,
          localizationsDelegates: localization.localizationsDelegates,
          supportedLocales: localization.supportedLocales,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      }),
    );
  }
}
