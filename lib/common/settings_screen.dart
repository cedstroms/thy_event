import 'package:flutter/material.dart';
import 'package:thyevent/common/widgets/settings_list.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FeedItem>>.value(
      value: DatabaseService().feed,
      child: StreamProvider<List<CompaniesItem>>.value(
        value: DatabaseService().companies,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            centerTitle: true,
          ),
          body: Container(
            child: SettingsList(),
          ),
        ),
      ),
    );
  }
}
