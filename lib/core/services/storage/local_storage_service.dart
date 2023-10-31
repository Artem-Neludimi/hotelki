import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/base_init_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_keys.dart';

abstract interface class _LocalStorageService implements BaseInitService {
  String get jwtToken;
}

class LocalStorageService with ApiLoggy implements _LocalStorageService {
  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  String get jwtToken => _preferences.getString(StorageKeys.accessToken) ?? '';
}
