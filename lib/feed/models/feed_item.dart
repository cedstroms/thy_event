import 'package:flutter/material.dart';

class FeedItem {
  final String logo;
  final String author;
  final String date;
  final String content;
  final int authorID;
  bool showMore;

  FeedItem(
      {this.logo,
      this.author,
      this.date,
      this.content,
      this.showMore = false,
      this.authorID});

  void toggleLessMore() {
    print('$showMore in toggleLessMore in FeedItem - övre');
    showMore = !showMore;
    print('$showMore in toggleLessMore in FeedItem - undre');
  }
}

class FeedProperties with ChangeNotifier {
  static int filterID = 0;

}

class ShowLessShowMore with ChangeNotifier {
  void changerLessMore(FeedItem feedItem) {
    feedItem.toggleLessMore();
    print('${feedItem.showMore} in feedItem ChangerLessMore');
    notifyListeners();
  }
}
