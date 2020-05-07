import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MyThemes { light, dark }

class ThemeChanger with ChangeNotifier {
  //List all themes. Here we have two themes: light and dark
  static final List<ThemeData> themeData = [
    ThemeData.light().copyWith(
      primaryColor: Colors.blueAccent,
      accentColor: Colors.lightBlueAccent,
      scaffoldBackgroundColor: Color(0xffE9E9E9),
      dividerTheme: DividerThemeData(
        space: 0,
        thickness: 1,
        color: Color(0xffDCDCDC),
      ),
    ),
    ThemeData.dark().copyWith(
      cardColor: Color(0xff3a3a3a),
      scaffoldBackgroundColor: Color(0xff303030),
      accentColor: Colors.lightBlueAccent,
      dividerColor: Color(0xff303030),
      dividerTheme: DividerThemeData(
        space: 0,
        thickness: 1,
      ),
    ),
  ];

  MyThemes _currentTheme = MyThemes.light;
  ThemeData _currentThemeData = themeData[MyThemes.light.index];

  void switchTheme(BuildContext context) async {
    currentTheme == MyThemes.light
        ? currentTheme = MyThemes.dark
        : currentTheme = MyThemes.light;

    activateTheme(currentTheme);
  }

  Future<void> activateTheme(MyThemes theme) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', theme.index);
  }

  void loadActiveThemeData(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    int themeId = sharedPrefs.getInt('theme_id') ?? MyThemes.light.index;
    currentTheme = MyThemes.values[themeId];
  }

  set currentTheme(MyThemes theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData = themeData[_currentTheme.index];
      notifyListeners();
    }
  }

  get currentTheme => _currentTheme;

  get currentThemeData => _currentThemeData;
}
