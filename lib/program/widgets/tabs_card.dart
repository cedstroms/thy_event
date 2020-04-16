import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  final String cardTitle;
  final int cardNumberTab;
  TabCard({this.cardNumberTab, this.cardTitle});
  @override
  Widget build(BuildContext context) {
    return Tab(
      text: cardTitle,
    );
  }
}
