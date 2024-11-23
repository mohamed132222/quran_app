import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigData extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", appLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", appTheme == ThemeMode.light ? "light" : "dark");
    notifyListeners();
  }
}
