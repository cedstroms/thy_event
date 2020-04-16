import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String startTime;
  final String stopTime;
  final String title;
  final String subTitle;

  ProgramCard({this.startTime, this.stopTime, this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              startTime,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Text(stopTime, style: TextStyle(color: Colors.black45)),
          ],
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
