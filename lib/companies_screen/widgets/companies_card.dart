import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies_screen/screens/companies_info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompaniesCard extends StatelessWidget {
  final String cardLogo;
  final String cardTitle;

  CompaniesCard({this.cardLogo, this.cardTitle});

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
                      builder: (context) => CompaniesInfoScreen()));
            },
            child: CircleAvatar(
              child: Container(
                child: SvgPicture.asset(cardLogo),
                margin: EdgeInsets.all(14),
                color: Colors.transparent,
              ),
              radius: 38,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            cardTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
