import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramCard extends StatelessWidget {
  final ProgramItem program;
  ProgramCard(this.program);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              program.startTime,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Text(program.stopTime, style: TextStyle(color: Colors.black45)),
          ],
        ),
        title: Text(program.title),
        subtitle: Text(program.subTitle),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
