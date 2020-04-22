import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thyevent/services/shared_preferences.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {


  @override
  Widget build(BuildContext context) {
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
                favourite: () async {
                  companiesData.updateFavourite(companies[index]);
                  companies[index].isFavourite
                      ? await SharedPreferencesHelper.setCompanyNames([companies[index].name])
                      : await SharedPreferencesHelper.removeCompanyNames([companies[index].name]);
                });
          },
        );
      }
    );

  }
}
