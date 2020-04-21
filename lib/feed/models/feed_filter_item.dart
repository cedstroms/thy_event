import 'package:flutter/material.dart';

//TODO: kombinera denna med compact-klasesen, typ genom abstract??

class FeedFilterItem {
  final Icon logo;
  final String title;
  final String subtitle;
  final String size;

  FeedFilterItem({this.logo, this.title, this.subtitle, this.size});
}

class FeedFilterItemCompact {
  final String title;

  FeedFilterItemCompact({this.title});
}
