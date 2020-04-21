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
      color: Theme
          .of(context)
          .cardColor,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              startTime,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              stopTime,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        onTap: () {
          //TODO: implementera program info view
          print('pressed program card');
        },
        onLongPress: () {
          //TODO: implementera favoritmarkering
          print('favourited');
        },
        trailing: IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            //TODO: implementera favoritmarkering
            print('favourited');
          },
        ),
      ),
    );
  }
}
