import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/feed/widgets/feed_card.dart';
import 'package:provider/provider.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    final feed = Provider.of<List<FeedItem>>(context) ?? [];
    return ListView.builder(
      itemCount: feed.length,
      itemBuilder: (context, index) {
        return FeedCard(feed[index]);
      },
    );
  }
}
