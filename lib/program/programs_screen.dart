import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_data.dart';
import 'package:thyevent/program/widgets/program_list.dart';
import 'package:thyevent/program/widgets/tab_list_creator.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

class ProgramScreen extends StatelessWidget {
  static const String id = 'program_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build program screen
    List<Widget> hdhd = [
      ProgramList(),
      //ProgramList(),
    ];
    return StreamProvider<List<ProgramItem>>.value(
      value: DatabaseService().program,
      child: DefaultTabController(
          length: 1,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Program'),
                centerTitle: true,
                leading: Icon(Icons.filter_list),
                bottom: TabBar(
                  indicatorWeight: 10.0,
                  indicatorColor: Colors.white,
                  tabs: [
//                  TabList(),
//                  TabList(),
                    //Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
//                  Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              body: TabBarView(children: hdhd)

//              ProgramList(),
//              ProgramList(),
              )),
    );
  }
}
