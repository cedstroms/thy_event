import 'package:flutter/material.dart';

class FeedItem {
  final int feedIdAuthor;
  final String logo;
  final String author;
  final String date;
  final String content;
  final int authorID;
  bool showMore;

  FeedItem({this.logo,
    this.author,
    this.date,
    this.content,
    this.showMore = false,
    this.authorID});

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
