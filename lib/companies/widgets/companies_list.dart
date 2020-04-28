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
    List<String> insideList = outsideList;

    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];

    return Consumer<CompaniesProvider>(
        builder: (context, companiesData, child) {
      return GridView.builder(
        itemCount: companies.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return CompaniesCard(
              company: companies[index],
              //Below should be the list with the sharedPreferences
              favouriteList: insideList, //insideList,
              favourite: () async {
                getStringList();
                companiesData.updateFavourite(companies[index], insideList);
                //insideList.contains(companies[index].name)
//                  companies[index].isFavourite
//                      ? await SharedPreferencesHelper.addCompanyNames([companies[index].name])
//                      : await SharedPreferencesHelper.removeCompanyNames([companies[index].name]);
              });
        },
      );
    });
  }
}
