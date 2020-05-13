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
    showMore = !showMore;
  }
}

class FeedProperties with ChangeNotifier {
  static int filterID = 0;

}

class ShowLessShowMore with ChangeNotifier {
  void changerLessMore(FeedItem feedItem) {
    print('${feedItem.showMore} in feeed_item');
    feedItem.toggleLessMore();
    notifyListeners();
  }
}
