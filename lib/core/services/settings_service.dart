import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {

  Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

}