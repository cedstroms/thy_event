import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(bool themeValue) {
    if (!themeValue) {
      _themeData = ThemeData.dark().copyWith(
        cardColor: Color(0xff3a3a3a),
        scaffoldBackgroundColor: Color(0xff303030),
        accentColor: Colors.lightBlueAccent,
        dividerColor: Color(0xff303030),
        dividerTheme: DividerThemeData(
          space: 0,
          thickness: 1,
        ),
      );
    }
    if (themeValue) {
      _themeData = ThemeData.light().copyWith(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Color(0xffE9E9E9),
        dividerTheme: DividerThemeData(
          space: 0,
          thickness: 1,
          color: Color(0xffDCDCDC),
        ),
      );
    }
    notifyListeners();
  }
}