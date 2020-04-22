import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/companies/models/companies_item.dart';


class CompaniesCard extends StatelessWidget {
  final CompaniesItem company;
  final Function favourite;

  CompaniesCard({this.company, this.favourite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(
                      builder: (context) => CompaniesInfoScreen(company)));
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                CircleAvatar(
                  child: Container(
                    child: SvgPicture.network(company.logo),
                    margin: EdgeInsets.all(14),
                    color: Colors.transparent,
                  ),
                  radius: 38,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Theme
                        .of(context)
                        .cardColor,
                    child: company.isFavourite ?
                    Icon(
                      Icons.star_border,
                      size: 20.0,
                      color: Colors.black,)
                    : Icon(
                      Icons.star,
                      size: 20.0,
                      color: Colors.yellow,
                    ),
                    onPressed: favourite,
                      // TODO turn the symbol yellow as in marked and
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Text(
            company.name,
            style: TextStyle(
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}