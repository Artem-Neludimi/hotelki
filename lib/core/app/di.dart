import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scalable_flutter_app_starter/core/localization/app_localization.dart';
import 'package:scalable_flutter_app_starter/core/navigation/router.dart';
import 'package:scalable_flutter_app_starter/core/services/deep_linking/deep_link_service.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/auth/firebase_auth_service.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firestore/firebase_firestore_service.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/storage/firebase_storage_service.dart';
import 'package:scalable_flutter_app_starter/core/services/pick_image/pick_image_service.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';
import 'package:scalable_flutter_app_starter/feature/auth/data/auth_repository.dart';
import 'package:scalable_flutter_app_starter/feature/home/data/home_repository.dart';
import 'package:scalable_flutter_app_starter/feature/partner_settings/data/partner_settings_repository.dart';

import '../../feature/auth/logic/bloc/auth_bloc.dart';
import '../services/firebase/firebase.dart';

class DI extends StatelessWidget {
  const DI({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _ServiceDI(
      child: _RepositoryDI(
        child: _BlocDI(
          child: child,
        ),
      ),
    );
  }
}

class _ServiceDI extends StatelessWidget {
  const _ServiceDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalStorageService>(
          create: (context) => LocalStorageServiceImpl(),
        ),
        RepositoryProvider<FirebaseService>(
          create: (context) => FirebaseServiceImpl(),
        ),
        RepositoryProvider<FirebaseAuthService>(
          create: (context) => FirebaseAuthServiceImpl(),
        ),
        RepositoryProvider<FirebaseFirestoreService>(
          create: (context) => FirebaseFirestoreServiceImpl(),
        ),
        RepositoryProvider<FirebaseStorageService>(
          create: (context) => FirebaseStorageServiceImpl(),
        ),
        RepositoryProvider<DeepLinkService>(
          create: (context) => DeepLinkServiceImpl(router),
        ),
        RepositoryProvider<ImagePickerService>(
          create: (context) => ImagePickerServiceImpl(),
        ),
      ],
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            context.read<FirebaseFirestoreService>(),
            context.read<FirebaseAuthService>(),
          ),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            context.read<FirebaseFirestoreService>(),
            context.read<FirebaseStorageService>(),
          ),
        ),
        RepositoryProvider<PartnerSettingsRepository>(
          create: (context) => PartnerSettingsRepositoryImpl(
            context.read<FirebaseFirestoreService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppLocalization(
            context.read<LocalStorageService>(),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            context.read<AuthRepository>(),
          )..add(const AppStarted()),
        ),
      ],
      child: child,
    );
  }
}
