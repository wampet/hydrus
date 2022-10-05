import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydrus/core/constants/constants.dart';

class SharedPreferencesHelper {
  static void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferencesTokenKey, token);
  }

  static void clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesTokenKey);
  }

  static void setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferencesLanguage, languageCode);
  }

  static Future<String?> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencesLanguage);
  }
}
