// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Creating Hotelka`
  String get creatingHotelka {
    return Intl.message(
      'Creating Hotelka',
      name: 'creatingHotelka',
      desc: '',
      args: [],
    );
  }

  /// `Create Hotelka`
  String get createHotelka {
    return Intl.message(
      'Create Hotelka',
      name: 'createHotelka',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get description {
    return Intl.message(
      'Описание',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Рeференсы`
  String get references {
    return Intl.message(
      'Рeференсы',
      name: 'references',
      desc: '',
      args: [],
    );
  }

  /// `Важно`
  String get important {
    return Intl.message(
      'Важно',
      name: 'important',
      desc: '',
      args: [],
    );
  }

  /// `Ставьте галочку только если эта хотелка критически важна`
  String get importantDescription {
    return Intl.message(
      'Ставьте галочку только если эта хотелка критически важна',
      name: 'importantDescription',
      desc: '',
      args: [],
    );
  }

  /// `Категория`
  String get category {
    return Intl.message(
      'Категория',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Фильмы`
  String get movies {
    return Intl.message(
      'Фильмы',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `Цветы`
  String get flowers {
    return Intl.message(
      'Цветы',
      name: 'flowers',
      desc: '',
      args: [],
    );
  }

  /// `Свидания`
  String get dates {
    return Intl.message(
      'Свидания',
      name: 'dates',
      desc: '',
      args: [],
    );
  }

  /// `Подарки`
  String get presents {
    return Intl.message(
      'Подарки',
      name: 'presents',
      desc: '',
      args: [],
    );
  }

  /// `Букет роз`
  String get bouquetOfRose {
    return Intl.message(
      'Букет роз',
      name: 'bouquetOfRose',
      desc: '',
      args: [],
    );
  }

  /// `Видела в магазине у дома офигенный букет`
  String get bouquetDescription {
    return Intl.message(
      'Видела в магазине у дома офигенный букет',
      name: 'bouquetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ссылка на место`
  String get placeLink {
    return Intl.message(
      'Ссылка на место',
      name: 'placeLink',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
