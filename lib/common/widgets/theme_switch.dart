import 'package:flutter/material.dart';
import 'package:thyevent/common/widgets/theme_changer.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Switch(
        value: value,
        activeColor: Colors.lightBlueAccent,
        onChanged: (changeValue) {
          setState(() {
            value = changeValue;
            _themeChanger.setTheme(value);
          });
        });
  }
}
