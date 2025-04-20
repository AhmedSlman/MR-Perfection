import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    return await _prefs.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  static String? getToken() {
    return _prefs.getString('token');
  }
} 