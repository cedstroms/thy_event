import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/feed/screens/feed_filter_screen.dart';
import 'package:thyevent/feed/screens/feed_settings_screen.dart';
import 'package:thyevent/feed/widgets/feed_list.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class FeedScreen extends StatelessWidget {
  static String id = 'feed_screen';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CompaniesItem>>.value(
      value: DatabaseService().companies,
      child: StreamProvider<List<FeedItem>>.value(
        value: DatabaseService().feed,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Feed',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => FeedFilterScreen()));
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
            ],
          ),
          body: FeedList(),
        ),
      ),
    );
  }
}
