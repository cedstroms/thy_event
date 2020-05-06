import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/feed/widgets/feed_card.dart';
import 'package:provider/provider.dart';

import '../../companies/models/companies_item.dart';
import '../models/feed_item.dart';
import '../models/feed_item.dart';

class FeedList extends StatefulWidget {
  final int filterID;

  FeedList(this.filterID);

  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    final feed = Provider.of<List<FeedItem>>(context) ?? [];

    // This creates a list containg all posts from the arrangers ergo authorID = 0
    List<FeedItem> officialFeedList = [];
    for (var f in feed) {
      if (f.authorID == 0) {
        officialFeedList.add(f);
      }
    }


    return Consumer<CompaniesProvider>(builder: (context, companiesData, child) {
      return Consumer<FeedProperties>(builder: (context, feedData, child) {
        List<FeedItem> favouriteFeedList = [];
        // This creates a list with all posts coming from a favourite marked author
        for (var f in feed) {
//          if (companiesData.listOfFavourites.contains(f.author)){
//            //TODO en bugg här som är knäpp
//            print('in feed list');
//            //favouriteFeedList.add(f);
//          }
        }
        return FeedProperties.filterID == 0
            ? ListView.builder(
            shrinkWrap: true,
            itemCount: feed.length,
            itemBuilder: (context, index) {
              return FeedCard(
                feed: feed[index],
                onPressedCallbackShowMore: () {
                  feedData.changerLessMore(feed[index]);
                },
              );
            })
            : FeedProperties.filterID == 1
            ? ListView.builder(
            shrinkWrap: true,
            itemCount: officialFeedList.length,
            itemBuilder: (context, index) {
              return FeedCard(
                feed: officialFeedList[index],
                onPressedCallbackShowMore: () {
                  feedData.changerLessMore(officialFeedList[index]);
                },
              );
            })
            : ListView.builder(
            shrinkWrap: true,
            itemCount: favouriteFeedList.length,
            itemBuilder: (context, index) {
              return FeedCard(
                feed: favouriteFeedList[index],
                onPressedCallbackShowMore: () {
                  feedData.changerLessMore(favouriteFeedList[index]);
                },
              );
            });
      });
    });
  }
}
