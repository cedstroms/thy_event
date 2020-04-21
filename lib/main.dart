import 'package:flutter/material.dart';
import 'package:thyevent/common/theme.dart';
import 'package:thyevent/feed/screens/feed_screen.dart';
import 'package:thyevent/companies/screens/companies_screen.dart';
import 'package:thyevent/common/navigation_bar_bottom.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/programs_screen.dart';
import 'package:thyevent/map/map_screen.dart';
import 'package:thyevent/program/widgets/program_list.dart';
import 'package:thyevent/feed/widgets/feed_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (BuildContext context) => ProgramData()),
        ChangeNotifierProvider<TabNavigationBarProvider>(
            //TODO implementera provider för att lösa dynamiken i programs används inte för tillfället
            create: (BuildContext context) => TabNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => ShowLessShowMore()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (BuildContext context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider<ThemeChanger>(
          create: (BuildContext context) => ThemeChanger(
            ThemeData.light().copyWith(
              primaryColor: Colors.blueAccent,
              accentColor: Colors.lightBlueAccent,
              scaffoldBackgroundColor: Color(0xffE9E9E9),
              dividerTheme: DividerThemeData(
                space: 0,
                thickness: 1,
                color: Color(0xffDCDCDC),
              ),
            ),
          ),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var currentBottomTab = [
    FeedScreen(),
    CompaniesScreen(),
    ProgramScreen(),
    MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentBottomTab[provider.currentIndex],
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
