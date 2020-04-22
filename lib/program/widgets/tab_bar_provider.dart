//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//class TabBar extends StatefulWidget {
//  @override
//  _TabBarState createState() => _TabBarState();
//}
//
//class _TabBarState extends State<TabBar> {
//  var tabList = [];
//
//  @override
//  Widget build(BuildContext context) {
//    var provider = Provider.of<TabNavigationBarProvider>(context);
////    return Scaffold(
////      body: currentBottomTab[provider.currentIndex],
////      bottomNavigationBar: NavigationBarBottom(),
////    );
//  }
//}
//
//class TabNavigationBarProvider with ChangeNotifier {
//  int _tabIndex = 0;
//  get tabIndex => _tabIndex;
//
//  set tabIndex(int index) {
//    _tabIndex = index;
//    notifyListeners();
//  }
//}
