import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/base_init_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_keys.dart';

abstract interface class LocalStorageService implements BaseInitService {
  String? get locale;
  Future<void> saveLocale(String value);
}

class LocalStorageServiceImpl with ServiceLoggy implements LocalStorageService {
  SharedPreferences? _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String? get locale => _preferences!.getString(StorageKeys.locale);

  @override
  Future<void> saveLocale(String value) async {
    await _preferences!.setString(StorageKeys.locale, value);
  }
}
