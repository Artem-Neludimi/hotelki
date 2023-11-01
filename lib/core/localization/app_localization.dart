import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/storage/local_storage_service.dart';

import 'generated/l10n.dart';

class AppLocalization with ChangeNotifier, NotifierLoggy {
  final LocalStorageService _storage;
  AppLocalization(this._storage);

  Locale get locale {
    final localeString = _storage.locale;
    return localeString == null ? Language.fromPlatformLocale().locale : Language.byName(localeString).locale;
  }

  void setLocale(String cultureKey) {
    if (cultureKey == Language.byLocale(locale).name) return;
    _storage.saveLocale(cultureKey);
    notifyListeners();
  }

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  Iterable<Locale> get supportedLocales => S.delegate.supportedLocales;
}

enum Language {
  en(locale: Locale('en')),
  ru(locale: Locale('ru'));

  final Locale locale;
  const Language({required this.locale});

  String title(BuildContext context) {
    switch (this) {
      case Language.en:
        return S.of(context).english;
      case Language.ru:
        return S.of(context).russian;
    }
  }

  static Language byLocale(Locale locale) => Language.values.firstWhere((language) => language.locale == locale);

  static Language byName(String name) =>
      Language.values.firstWhere((language) => language.name == name, orElse: () => Language.en);

  static Language fromPlatformLocale() => Language.values
      .firstWhere((language) => language.name == Platform.localeName.substring(0, 2), orElse: () => Language.en);
}
