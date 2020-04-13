import 'package:flutter/material.dart';
import 'package:thyevent/screens/feed_filter_screen.dart';
import 'package:thyevent/screens/feed_screen.dart';
import 'package:thyevent/screens/companies_screen.dart';
import 'package:thyevent/widgets/navigation_bar_bottom.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/screens/programs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: FeedScreen.id,
      routes: {
        //FeedScreen.id: (context) => FeedScreen(),
        FeedFilterScreen.id: (context) => FeedFilterScreen(),
        //CompaniesScreen.id: (context) => CompaniesScreen(),
      },
      home: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: BottomNavigationBarExample(),
        create: (BuildContext context) => BottomNavigationBarProvider(),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  var currentTab = [
    FeedScreen(),
    CompaniesScreen(),
    ProgramScreen(),
  ];
  static String id = 'start_screen';

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
