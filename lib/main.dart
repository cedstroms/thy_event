import 'package:flutter/material.dart';
import 'package:thyevent/feed/screens/feed_filter_screen.dart';
import 'package:thyevent/feed/screens/feed_screen.dart';
import 'package:thyevent/companies/screens/companies_screen.dart';
import 'package:thyevent/common/navigation_bar_bottom.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/programs_screen.dart';
import 'package:thyevent/map/map_screen.dart';
import 'package:thyevent/program/widgets/program_data.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProgramData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.lightBlueAccent,
          scaffoldBackgroundColor: Color(0xffE9E9E9),
        ),
        routes: {
          FeedScreen.id: (context) => FeedScreen(),
          FeedFilterScreen.id: (context) => FeedFilterScreen(),
          CompaniesScreen.id: (context) => CompaniesScreen(),
        },
        home: ChangeNotifierProvider<BottomNavigationBarProvider>(
          child: NavigationBar(),
          create: (BuildContext context) => BottomNavigationBarProvider(),
        ),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var currentTab = [
    FeedScreen(),
    CompaniesScreen(),
    ProgramScreen(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: NavigationBarBottom(),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
