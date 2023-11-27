import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs ??= prefs = await SharedPreferences.getInstance();
  }

  static void dispose() => prefs = null;
  static Future<bool> clear() => prefs!.clear();
}
