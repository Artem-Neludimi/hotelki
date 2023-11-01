import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/base_init_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_keys.dart';

final localStorageService = LocalStorageService();

abstract interface class _LocalStorageService implements BaseInitService {
  int? get getToken;
  Future<void> saveToken(int token);
  Future<void> clearToken();

  String? get locale;
  Future<void> saveLocale(String value);
}

class LocalStorageService with ApiLoggy implements _LocalStorageService {
  SharedPreferences? _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveToken(int token) async {
    await _preferences!.setInt(StorageKeys.accessToken, token);
  }

  @override
  Future<void> clearToken() async {
    await _preferences!.remove(StorageKeys.accessToken);
  }

  @override
  int? get getToken => _preferences!.getInt(StorageKeys.accessToken);

  @override
  String? get locale => _preferences!.getString(StorageKeys.locale);

  @override
  Future<void> saveLocale(String value) async {
    await _preferences!.setString(StorageKeys.locale, value);
  }
}
