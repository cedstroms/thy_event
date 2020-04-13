import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed_screen/widgets/feed_filter_list.dart';

class FeedFilterScreen extends StatelessWidget {
  static String id = 'feed_filter_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build feed filter screen
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Filter',
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.add),
          )
        ],
      ),
      backgroundColor: Color(0xffE9E9E9),
      body: Container(
        child: FeedFilterList(),
      ),
    );
  }
}
