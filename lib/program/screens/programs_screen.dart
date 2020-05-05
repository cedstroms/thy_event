import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/screens/programs_first_view.dart';
import 'package:thyevent/program/screens/programs_second_view.dart';
import 'package:thyevent/program/screens/programs_third_view.dart';
import 'package:thyevent/services/shared_preferences.dart';


class ProgramScreen extends StatefulWidget {
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  List<String> outsideList = [];
  void getStringList() async {
    var tempList = await SharedPreferencesHelper.getProgramNames();
    print(tempList);
    outsideList = tempList;
  }
  bool showFavourites = false;

  @override
  Widget build(BuildContext context) {
    //Get the outsideList and make it usable as a List<String> and not a Future
    getStringList();
    List<String> insideList = outsideList;

    // TODO: build program screen
    return StreamProvider<List<ProgramItem>>.value(
      value: DatabaseService().program,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Program'),
            centerTitle: true,
            leading: IconButton(
              icon: !ProgramProvider().getFavouriteState()
                  ? Icon(Icons.star_border)
                  : Icon(Icons.star, color: Colors.yellow,),
              onPressed: () {
                ProgramProvider().toggleShowFavouriteFilter();
                setState(() {
                });
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('pressed: search program events');
                },
              ),
            ],
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
              FirstView(
                favouriteList: insideList,
              ),
              SecondView(
                favouriteList: insideList,
              ),
              ThirdView(
                favouriteList: insideList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
