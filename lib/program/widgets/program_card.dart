import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramCard extends StatelessWidget {
  final ProgramItem program;
  ProgramCard(this.program);
//  final String startTime;
//  final String stopTime;
//  final String title;
//  final String subTitle;
//
//  ProgramCard({this.startTime, this.stopTime, this.title, this.subTitle});

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
        trailing: IconButton(
          icon: Icon(Icons.star_border),
          onPressed: () {
            //TODO: implementera favoritmarkering
            print('pressed: mark as favourite');
          },
        ),
      ),
    );
  }
}
