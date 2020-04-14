import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed_screen/screens/feed_filter_screen.dart';
import 'package:thyevent/feed_screen/widgets/feed_list.dart';

class FeedScreen extends StatelessWidget {
  static String id = 'feed_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => FeedFilterScreen()));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: FeedList(),
    );
  }
}
