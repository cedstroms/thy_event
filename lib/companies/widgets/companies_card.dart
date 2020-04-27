import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/services/shared_preferences.dart';

import '../models/companies_item.dart';
import '../models/companies_item.dart';

class CompaniesCard extends StatelessWidget {
  final CompaniesItem company;
  final Function favourite;
  final List<String> favouriteList;

  CompaniesCard({this.company, this.favourite, this.favouriteList});

  void setFavourite(CompaniesItem company){
    if (favouriteList.contains(company.name)){
      company.isFavourite = true;
    }
    else {
      company.isFavourite = false;
    }
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                  context,
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
                  child: FloatingActionButton (
                    heroTag: null,
                    backgroundColor: Theme
                        .of(context)
                        .cardColor,
                    child: favouriteList.contains(company.name)
                        ? Icon(
                      Icons.star,
                      size: 20.0,
                      color: Colors.yellow,
                    )
                        : Icon(
                      Icons.star_border,
                      size: 20.0,
                      color: Colors.black,
                    ),
                    onPressed: favourite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Text(
            company.name,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
