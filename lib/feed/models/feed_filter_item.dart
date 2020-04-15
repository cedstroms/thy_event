import 'package:flutter/material.dart';

//TODO: kombinera denna med compact-klasesen, typ genom abstract??

class FeedFilterItem {
  final Icon logo;
  final String title;
  final String subtitle;

  FeedFilterItem({this.logo, this.title, this.subtitle});
}

class FeedFilterItemCompact {
  final String title;

  FeedFilterItemCompact({this.title});
}