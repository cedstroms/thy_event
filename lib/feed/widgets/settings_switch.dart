import 'package:flutter/material.dart';
import 'package:thyevent/common/theme.dart';
import 'package:provider/provider.dart';

class SettingsSwitch extends StatefulWidget {

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  //final Function isToggled;
  bool value = true;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Switch(
        value: value,
        activeColor: Colors.lightBlueAccent,
        onChanged: (changeValue) {
          print(value);
          setState(() {
            value = changeValue;
          });
        }
    );
  }
}