import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_card.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/widgets/companies_info_list.dart';
import 'package:thyevent/services/shared_preferences.dart';
import 'package:thyevent/companies/screens/companies_screen.dart';

import '../models/companies_item.dart';
import '../models/companies_item.dart';
import '../screens/companies_screen.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<String> outsideList;
  void getStringList() async {
    var tempList = await SharedPreferencesHelper.getCompanyNames();
    outsideList = tempList;
  }

  @override
  Widget build(BuildContext context) {
    getStringList();
    List<CompaniesItem> favouritesList = [];
    List<String> insideList = outsideList;
    //List of companies provided by the database
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];

    //Create a list of CompaniesItem that are marked favourites
    for (var i = 0; i < companies.length; i++) {
      if (insideList.contains(companies[i].name)) {
        favouritesList.add(companies[i]);
      }
    }

    return Consumer<CompaniesProvider>(
        builder: (
            context,
            companiesData,
            child) {
      return !companiesData.getFavouriteState()
          ? GridView.builder(
              itemCount: favouritesList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return CompaniesCard(
                    company: favouritesList[index],
//InsideList below is the updated list of chosen favourites
                    favouriteList: insideList, //insideList,
                    favourite: () async {
                      getStringList();
                      companiesData.updateFavourite(
                          favouritesList[index], insideList);
                    });
              },
            )
          : GridView.builder(
              itemCount: companies.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return CompaniesCard(
                    company: companies[index],
//InsideList below is the updated list of chosen favourites
                    favouriteList: insideList, //insideList,
                    favourite: () async {
                      getStringList();
                      companiesData.updateFavourite(
                          companies[index], insideList);
                    });
              },
            );
    });
  }
}