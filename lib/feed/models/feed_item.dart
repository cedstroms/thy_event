class FeedItem {
  final String feedLogo;
  final String feedAuthor;
  final String feedDate;
  final String feedContent;
  bool showMore;

  FeedItem(
      {this.feedLogo,
      this.feedAuthor,
      this.feedDate,
      this.feedContent,
      this.showMore = false});
  void toggleLessMore() {
    showMore = !showMore;
  }
}