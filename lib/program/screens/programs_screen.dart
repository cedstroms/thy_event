import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_list.dart';
import 'package:thyevent/program/screens/programs_first_view.dart';
import 'package:thyevent/program/screens/programs_second_view.dart';
import 'package:thyevent/program/screens/programs_third_view.dart';

class ProgramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: build program screen
    return StreamProvider<List<ProgramItem>>.value(
      value: DatabaseService().program,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Program'),
            centerTitle: true,
            leading: Icon(Icons.filter_list),
            bottom: TabBar(
              indicatorWeight: 4.0,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Thursday'),
                Tab(text: 'Friday'),
                Tab(text: 'Saturday'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              FirstView(),
              SecondView(),
              ThirdView(),
            ],
          ),
        ),
      ),
    );
  }
}
