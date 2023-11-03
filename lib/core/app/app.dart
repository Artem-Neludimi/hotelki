import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/app/di.dart';
import 'package:scalable_flutter_app_starter/core/app/style.dart';
import 'package:scalable_flutter_app_starter/core/navigation/router.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firebase.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';

import '../localization/app_localization.dart';

class ScalableFlutterApp extends StatelessWidget {
  const ScalableFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DI(
      child: _App(),
    );
  }
}

class _App extends StatefulWidget {
  const _App();

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _init().then((value) {
      setState(() => _isInitialized = true);
    });
  }

  Future<void> _init() => Future.wait([
        context.read<FirebaseService>().init(),
        context.read<LocalStorageService>().init(),
      ]);

  @override
  Widget build(BuildContext context) {
    final localization = context.watch<AppLocalization>();
    return _isInitialized
        ? MaterialApp.router(
            title: 'Scalable Flutter App',
            // localization
            locale: localization.locale,
            localizationsDelegates: localization.localizationsDelegates,
            supportedLocales: localization.supportedLocales,
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          )
        : const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
  }
}
