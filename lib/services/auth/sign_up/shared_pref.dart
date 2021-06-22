import 'package:shared_preferences/shared_preferences.dart';

class Shared_pref {
  SharedPreferences preferences;

  Future<bool> get_bool(String key) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    return await preferences.getBool(key) ?? false;
  }

  Future<void> set_bool(String key, bool value) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }

  Future<String> get_string(String key) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    return await preferences.getString(key) ?? "null";
  }

  Future<void> set_string(String key, String value) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }
}
