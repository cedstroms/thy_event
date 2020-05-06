import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_card.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/services/shared_preferences.dart';

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
    List<CompaniesItem> companiesList = [];
    List<String> insideList = outsideList;

    //List of companies provided by the database
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];

    //Checks database list and add all non-hidden companies to new list
    for (var i = 0; i < companies.length; i++) {
      if (!companies[i].isHidden) {
        companiesList.add(companies[i]);
      }
    }

    // Set the list parameter to the SharedPref-list
    for (var company in companies) {
      company.listOfFavourites = insideList;
    }
    //Create a list of CompaniesItem that are marked favourites
    for (var i = 0; i < companiesList.length; i++) {
      if (insideList.contains(companiesList[i].name)) {
        favouritesList.add(companiesList[i]);
      }
    }

    return Consumer<CompaniesProvider>(
        builder: (context, companiesData, child) {
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
                    favourite: () {
                      print('companies list');
                      //getStringList();
                      companiesData.updateFavourite(favouritesList[index]);
                    });
              },
            )
          : GridView.builder(
              itemCount: companiesList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return CompaniesCard(
                    company: companiesList[index],
                    //InsideList below is the updated list of chosen favourites
                    favouriteList: companiesData.listOfFavourites, //insideList,
                    favourite: () {
                      print('companies list');
                      //getStringList();
                      companiesData.updateFavourite(companiesList[index]);
                    });
              },
            );
    });
  }
}
