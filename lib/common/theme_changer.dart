import 'package:flutter/material.dart';
import 'package:thyevent/common/theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(bool themeValue) {
    if (!themeValue) {
      _themeData = ThemeSettings().getDarkTheme();
    }
    if (themeValue) {
      _themeData = ThemeSettings().getLightTheme();
    }
    notifyListeners();
  }
}

