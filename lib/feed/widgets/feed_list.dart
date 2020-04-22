import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/feed/widgets/feed_card.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class FeedList extends StatefulWidget {
  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    final feed = Provider.of<List<FeedItem>>(context) ?? [];
//    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];
    return Consumer<ShowLessShowMore>(builder: (context, feedData, child) {
      return ListView.builder(
          itemCount: feed.length,
          itemBuilder: (context, index) {
//            for (int i; i < companies.length; i++) {
//              if (feed[index].feedIdAuthor == companies[i].companyId) {
//                print(index);
//                print(i);
//              }
//            }

            return FeedCard(
              //company: companies[index],
              feed: feed[index],
              onPressedCallbackShowMore: () {
                feedData.changerLessMore(feed[index]);
              },
            );
          });
    });
  }
}
