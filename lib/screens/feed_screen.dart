import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/screens/feed_filter_screen.dart';
import 'package:thyevent/widgets/feed_list.dart';

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
                MaterialPageRoute(builder: (BuildContext context) {
                  return FeedFilterScreen();
                }));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: FeedList(),
    );
  }
}
