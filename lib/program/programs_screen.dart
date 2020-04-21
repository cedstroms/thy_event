import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_list.dart';
import 'package:thyevent/program/widgets/tabs_card.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/program/widgets/tab_list.dart';

class ProgramScreen extends StatelessWidget {
  static const String id = 'program_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build program screen
    List<Widget> programList = [
      ProgramList(),
      //ProgramList(),
    ];
    return StreamProvider<List<ProgramItem>>.value(
      value: DatabaseService().program,
      child: DefaultTabController(
          //TODO längden av arrayen med tabs
          length: 1,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Program'),
                centerTitle: true,
                leading: Icon(Icons.filter_list),
                bottom: TabBar(
                  indicatorWeight: 10.0,
                  indicatorColor: Colors.white,
                  //TODO här ska array med tabs in
                  tabs: [
                    //              TabList(),
                    TabList(
                      tabIndex: 0,
                    ),
                    //Tab(icon: Icon(Icons.directions_car)),
                    //Tab(icon: Icon(Icons.directions_transit)),
                    //Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              body: TabBarView(children: programListArray)

//              ProgramList(),
//              ProgramList(),
              )),
    );
  }
}

class TabNavigationBarProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}

//int tabCount() {
//  List tabListCount = [];
//  for (int i = 0; i < program.length; i++) {
//    tabListCount.add(program[i].numberTab);
//  }
//  print(Set.from(tabListCount).length);
//  return (Set.from(tabListCount).length);
//}
//
//for (int tabIndex = 0; tabIndex < tabCount(); tabIndex++) {
//List<Widget> tabList = [];
//tabList.add(Tab(
//text: '${program[tabIndex].tabTitle}',
//));
//}
