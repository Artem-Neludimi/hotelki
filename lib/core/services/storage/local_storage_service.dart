import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/base_init_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_keys.dart';

abstract interface class _LocalStorageService implements BaseInitService {
  Future<void> saveToken(int token);
  Future<void> clearToken();
  int? get getToken;
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
}
