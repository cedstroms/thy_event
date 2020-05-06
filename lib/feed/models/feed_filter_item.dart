import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';

//TODO: kombinera denna med compact-klasesen, typ genom abstract??

class FeedFilterItem {
  final Icon logo;
  final String title;
  final String subtitle;
  final String size;
  final Function onPressed;

  FeedFilterItem({this.logo, this.title, this.subtitle, this.size, this.onPressed});
}

class FeedFilterItemCompact {
  final String title;
  final CompaniesItem company;

  FeedFilterItemCompact({this.title, this.company});
}

class FeedFilterItemCompactNew {
  final CompaniesItem company;

  FeedFilterItemCompactNew({this.company});
}
