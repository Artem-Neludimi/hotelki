import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:scalable_flutter_app_starter/core/app/app.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';
import 'package:scalable_flutter_app_starter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localStorageService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _initLoggy();

  runApp(const ScalableFlutterApp());
}

void _initLoggy() {
  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.warning,
    ),
    logPrinter: const PrettyPrinter(),
  );
}
