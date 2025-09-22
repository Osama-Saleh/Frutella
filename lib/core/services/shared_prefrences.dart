import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService {

  static late SharedPreferences prefs;
  static Future<void> initialize() async {
     prefs = await SharedPreferences.getInstance();

  }

  static Future<void> setBool(String key,bool value) async {
    await prefs.setBool(key, value);
  }
  static bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }
}