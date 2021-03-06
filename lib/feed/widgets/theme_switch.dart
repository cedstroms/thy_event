import 'package:flutter/material.dart';
import 'package:thyevent/common/theme_changer.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  //TODO: just nu laddas ej temat till switchen för saved prefs
//  bool value = ThemeChanger().currentTheme == MyThemes.light;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Switch(
        value: value,
        activeColor: Colors.lightBlueAccent,
        onChanged: (changeValue) {
          Provider.of<ThemeChanger>(context, listen: false).switchTheme(
              context);
          setState(() {
            value = changeValue;
          });
        });
  }
}
