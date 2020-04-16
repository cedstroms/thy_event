import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramItem {
  final String startTime;
  final String stopTime;
  final String title;
  final String subTitle;
  final String tabTitle;
  final int numberTab;

  ProgramItem(
      {this.startTime,
      this.stopTime,
      this.title,
      this.subTitle,
      this.numberTab,
      this.tabTitle});
}

//class TabItem {
//  final String title;
//  final int numberTab;
//
//  TabItem({this.numberTab, this.title});
//}
