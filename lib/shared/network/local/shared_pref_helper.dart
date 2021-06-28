import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _sharedPref;

  static Future<void> init() async {
    if (_sharedPref == null) {
      _sharedPref = await SharedPreferences.getInstance();
    }
  }

  static Future<bool> setBoolean(
      {required String key, required bool value}) async {
    return await _sharedPref!.setBool(key, value);
  }

  static bool getBoolean({required key}) {
    return _sharedPref!.getBool(key) ?? false;
  }
}
