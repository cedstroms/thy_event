import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_card.dart';
import 'package:provider/provider.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];
    return GridView.builder(
      itemCount: companies.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return CompaniesCard(
          cardLogo: 'assets/images/ericsson_logo.svg',
          cardTitle: companies[index].companyName,
        );
      },
    );
  }
}