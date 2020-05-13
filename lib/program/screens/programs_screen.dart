import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_list.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/services/shared_preferences.dart';

import '../models/program_item.dart';
import '../widgets/program_list.dart';

class ProgramScreen extends StatefulWidget {
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  List<String> outsideList = [];
//  void getStringList() async {
//    var tempList = await SharedPreferencesHelper.getProgramNames();
//    // print('$tempList in getStrinList ProgramScreen');
//    outsideList = tempList;
//  }

  bool showFavourites = false;

  @override
  Widget build(BuildContext context) {
    //Get the outsideList and make it usable as a List<String> and not a Future
    List<String> insideList = outsideList;

    // TODO: build program screen
    return StreamProvider<List<ProgramItem>>.value(
      value: DatabaseService().program,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
          centerTitle: true,
          leading: IconButton(
            icon: !ProgramProvider().getFavouriteState()
                ? Icon(Icons.star_border)
                : Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
            onPressed: () {
              ProgramProvider().toggleShowFavouriteFilter();
              setState(() {});
            },
          ),
          //TODO: implementera sök-funktion
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search),
//              onPressed: () {
//                print('pressed: search program events');
//              },
//            ),
//          ],
        ),
        body: ProgramList(),
      ),
    );
  }
}
