import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/feed/screens/feed_filter_screen.dart';
import 'package:thyevent/feed/screens/settings_screen.dart';
import 'package:thyevent/feed/widgets/feed_list.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/navigation_bar_bottom.dart';
import '../models/feed_item.dart';
import '../models/feed_item.dart';

class FeedScreen extends StatelessWidget {
  static String id = 'feed_screen';

  int filterID;
  FeedScreen(this.filterID);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProperties>(builder: (context, feedData, child) {
      return StreamProvider<List<CompaniesItem>>.value(
        value: DatabaseService().companies,
        child: StreamProvider<List<FeedItem>>.value(
          value: DatabaseService().feed,
          child: Scaffold(
            appBar: AppBar(
              title: FeedProperties.filterID == 0
                  ? Text(
                'Feed',
              )
                  : FeedProperties.filterID == 1
                  ? Text(
                'Official Statements',
              )
                  : Text(
                'Posts from Favourites',
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.filter, size: 18,),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => FeedFilterScreen()));
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) =>
                          SettingsScreen()),
                    );
                  },
                ),
              ],
            ),
            body: FeedList(filterID),
          ),
        ),
      );
    });
  }
}
