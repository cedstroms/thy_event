import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: Color(0xff3a3a3a),
    scaffoldBackgroundColor: Color(0xff303030),
    accentColor: Colors.lightBlueAccent,
    dividerColor: Color(0xff303030),
    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 1,
    ),
  );

  ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueAccent,
    accentColor: Colors.lightBlueAccent,
    scaffoldBackgroundColor: Color(0xffE9E9E9),
    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 1,
      color: Color(0xffDCDCDC),
    ),
  );

  getDarkTheme() => darkTheme;

  getLightTheme() => lightTheme;
}
