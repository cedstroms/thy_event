import 'package:flutter/material.dart';
import 'package:thyevent/feed/widgets/settings_list.dart';


class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SettingsList(),
        ),
      );
  }
}
