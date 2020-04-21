import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  //final Function isToggled;
  bool value = true;

  @override
  Widget build(BuildContext context) {
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