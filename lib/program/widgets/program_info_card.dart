import 'package:flutter/material.dart';

class ProgramInfoCard extends StatelessWidget {
  final String header;
  final Object content;
  final String location;
  final String startTime;
  final String endTime;

  ProgramInfoCard({this.header, this.content, this.location, this.startTime, this.endTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(location,
              style: TextStyle(
                color: Colors.grey
              ),),
              Text('$startTime - $endTime',
              style: TextStyle(
                color: Colors.grey
              ),),
              SizedBox(
                height: 10.0,
                child: Divider(),
              ),
              content,
            ],
          ),
        ),
      ],
    );
  }
}