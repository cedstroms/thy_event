import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/services/shared_preferences.dart';


class ProgramCard extends StatelessWidget {
  final ProgramItem program;
  final Function favourite;
  final List<String> favouriteList;
  ProgramCard({this.program, this.favourite, this.favouriteList});

  void setFavourite(ProgramItem company){
    if (favouriteList.contains(program.title)){
      program.isFavourite = true;
    }
    else {
      program.isFavourite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              program.startTime,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              program.endTime,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        title: Text(program.title),
        subtitle: Text(program.subTitle),
        onTap: () {
          //TODO: implementera program info view
          print('pressed: program card');
        },
        onLongPress: () {
          //TODO: implementera favoritmarkering
          print('long pressed: mark as favourite');
        },
        trailing: !favouriteList.contains(program.title)
            ? IconButton(
                icon: Icon(Icons.star_border),
                onPressed: favourite,
//              () {
//            //TODO: implementera favoritmarkering
//            print('pressed: mark as favourite');
//          },
              )
            : IconButton(
                icon: Icon(Icons.star),
                color: Colors.yellow,
                onPressed: favourite,
//              () {
//            //TODO: implementera favoritmarkering
//            print('pressed: mark as favourite');
//          },
              ),
      ),
    );
  }
}
