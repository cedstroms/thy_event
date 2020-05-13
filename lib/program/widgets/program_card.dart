import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/screens/program_info_screen.dart';

class ProgramCard extends StatelessWidget {
  final ProgramItem program;
  final Function favourite;
  final List<String> favouriteList;

  ProgramCard({this.program, this.favourite, this.favouriteList});

  void setFavourite(ProgramItem company) {
    if (favouriteList.contains(program.title)) {
      program.isFavourite = true;
    } else {
      program.isFavourite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
//    return FutureBuilder<List<String>>(
//        future: favourite,
//        builder: (context, snapshot) {
    return Consumer<ProgramProvider>(
        builder: (context, programData, child) {
          programData.getStringListPrograms();
          return Container(
            color: Theme
                .of(context)
                .cardColor,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    program.startTimeOnlyTime,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    program.endTimeOnlyTime,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              title: Text(program.title),
              subtitle: Text(program.subTitle),
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => ProgramInfoScreen(program)));
              },
              onLongPress: () {
                //TODO: implementera favoritmarkering
                print('long pressed: mark as favourite');
              },
              trailing: !programData.listOfFavouriteP.contains(program.title)
                  ? IconButton(
                icon: Icon(Icons.star_border),
                onPressed: favourite,
              )
                  : IconButton(
                icon: Icon(Icons.star),
                color: Colors.yellow,
                onPressed: favourite,
              ),
            ),
          );
        });
  }
//);
}
//}
