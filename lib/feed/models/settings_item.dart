import 'package:flutter/material.dart';

//TODO: kombinera denna med compact-klasesen, typ genom abstract??

class SettingsItem {
  final Icon logo;
  final String title;
  final String subtitle;
  final Function onPressed;

  SettingsItem({this.logo, this.title, this.subtitle, this.onPressed});
}

class SettingsItemCompact {
  final String title;
  SettingsItemCompact({this.title});
}