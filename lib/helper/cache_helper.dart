import 'package:grocery_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;
  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getUserId() {
    return prefs.getString(kuserId) ?? "";
  }

  void saveUserId(String key, String value) async {
    prefs.setString(key, value);
  }

  String getString(String key) {
    return prefs.getString(key) ?? "";
  }

  void storeString(String key, String value) async {
    prefs.setString(key, value);
  }

  bool isKeyExists(String key) {
    return prefs.containsKey(key);
  }
}
