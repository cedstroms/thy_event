import 'package:flutter/material.dart';
import 'package:thyevent/screens/feed_filter_screen.dart';
import 'package:thyevent/screens/feed_screen.dart';
import 'package:thyevent/screens/companies_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FeedScreen.id,
      routes: {
        FeedScreen.id: (context) => FeedScreen(),
        FeedFilterScreen.id: (context) => FeedFilterScreen(),
        CompaniesScreen.id: (context) => CompaniesScreen(),
      },
    );
  }
}