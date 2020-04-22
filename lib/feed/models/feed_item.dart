import 'package:flutter/material.dart';

class FeedItem {
  final int feedIdAuthor;
  final String feedLogo;
  final String feedAuthor;
  final String feedDate;
  final String feedContent;
  bool showMore;

  FeedItem({
    this.feedLogo,
    this.feedAuthor,
    this.feedIdAuthor,
    this.feedDate,
    this.feedContent,
    this.showMore = false,
  });
  void toggleLessMore() {
    showMore = !showMore;
  }
}

class ShowLessShowMore with ChangeNotifier {
  bool feedShowFlag = false;

  void changerLessMore(FeedItem feedItem) {
    feedItem.toggleLessMore();
    notifyListeners();
  }
}
