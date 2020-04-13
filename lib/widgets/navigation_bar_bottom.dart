import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/main.dart';

//TODO BottomNavigationBarItem kan göras till en metod som man skickar in i, istället för att repetera kod

class NavigationBarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return BottomNavigationBar(
      currentIndex: provider.currentIndex,
      onTap: (index) {
        provider.currentIndex = index;
      },
      showUnselectedLabels: true,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted),
          title: Text('Feed'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Companies'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Program'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map'),
        ),
      ],
    );
  }
}
