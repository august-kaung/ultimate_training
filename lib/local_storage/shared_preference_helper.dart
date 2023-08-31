import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceHelper {
  SharePreferenceHelper._();

  static SharePreferenceHelper? _sharePreferenceHelper;
  static SharedPreferences? _preferences;

  static Future<SharePreferenceHelper?> getSPHelperInstance() async {
    if (_sharePreferenceHelper == null) {
      var secureStorage = SharePreferenceHelper._();
      await secureStorage._init();
      _sharePreferenceHelper = secureStorage;
    }
    return _sharePreferenceHelper;
  }

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setStringData(String key, String value) async {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.setString(key, value);

  }

  static String? getStringData(String key, {String value = ''}) {
    if (_preferences == null) {
      return value;
    }
    return _preferences!.getString(key);

  }
}
