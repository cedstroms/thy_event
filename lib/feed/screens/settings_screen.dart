import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_filter_item.dart';
import 'package:thyevent/feed/widgets/settings_list.dart';


class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'
        ),
      ),
      body: Container(
        child: SettingsList(),
        ),
      );
  }
}
