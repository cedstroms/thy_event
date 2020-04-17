import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class CompaniesCard extends StatelessWidget {
  final CompaniesItem company;

  CompaniesCard({this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(
                      builder: (context) => CompaniesInfoScreen(company)));
            },
            child: CircleAvatar(
              child: Container(
                child: SvgPicture.network(company.logo),
                margin: EdgeInsets.all(14),
                color: Colors.transparent,
              ),
              radius: 38,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            company.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
