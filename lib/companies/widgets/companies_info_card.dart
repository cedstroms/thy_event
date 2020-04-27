import 'package:flutter/material.dart';

class CompaniesInfoCard extends StatelessWidget {
  final String header;
  final Object content;

  CompaniesInfoCard({this.header, this.content});

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
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
