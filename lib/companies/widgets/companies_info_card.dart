import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class CompaniesInfoCard extends StatelessWidget {


  final String header;
  final String content;
  //final CompaniesItem company;

  CompaniesInfoCard({this.header, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(header,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.0,
                child: Divider(
                  color: Colors.black54,
                ),),
              Text(
                content,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
