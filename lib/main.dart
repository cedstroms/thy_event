import 'package:flutter/material.dart';
import 'package:thyevent/feed/widgets/theme_changer.dart';
import 'package:thyevent/feed/screens/feed_screen.dart';
import 'package:thyevent/companies/screens/companies_screen.dart';
import 'package:thyevent/common/navigation_bar_bottom.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/screens/programs_screen.dart';
import 'package:thyevent/map/map_screen.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'companies/screens/companies_screen.dart';
import 'common/theme.dart';
import 'program/models/program_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ShowLessShowMore()),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
            create: (BuildContext context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider<CompaniesProvider>(
            create: (BuildContext context) => CompaniesProvider()),
        ChangeNotifierProvider<ThemeChanger>(
          create: (BuildContext context) =>
              ThemeChanger(ThemeSettings().getLightTheme()),
        ),
        ChangeNotifierProvider<ProgramProvider>(
            create: (BuildContext context) => ProgramProvider()),
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
    var bottomNavProvider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentBottomTab[bottomNavProvider.currentIndex],
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
