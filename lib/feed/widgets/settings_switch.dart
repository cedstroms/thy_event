import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  //final Function isToggled;
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: toggled,
        activeColor: Colors.lightBlueAccent,
        onChanged: (newValue){
          setState(() {
            toggled = newValue;
          });
        }
    );
  }
}