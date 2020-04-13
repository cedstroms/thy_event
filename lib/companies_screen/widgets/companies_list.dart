import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies_screen/models/companies_item.dart';
import 'package:thyevent/companies_screen/widgets/companies_card.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<CompaniesItem> companies = [
    CompaniesItem(
      logo: Icon(Icons.phone, size: 36),
      company: 'Ericsson',
    ),
    CompaniesItem(
      logo: Icon(Icons.build, size: 36),
      company: 'SKF',
    ),
    CompaniesItem(
      logo: Icon(Icons.power, size: 36),
      company: 'SBAB',
    ),
    CompaniesItem(
      logo: Icon(Icons.people, size: 36),
      company: 'H&M',
    ),
    CompaniesItem(
      logo: Icon(Icons.monetization_on, size: 36),
      company: 'SEB',
    ),
    CompaniesItem(
      logo: Icon(Icons.attach_money, size: 36),
      company: 'ICA Banken',
    ),
    CompaniesItem(
      logo: Icon(Icons.whatshot, size: 36),
      company: 'ABB',
    ),
    CompaniesItem(
      logo: Icon(Icons.show_chart, size: 36),
      company: 'NASDAQ',
    ),
    CompaniesItem(
      logo: Icon(Icons.power_settings_new, size: 36),
      company: 'Vattenfall',
    ),
    CompaniesItem(
      logo: Icon(Icons.public, size: 36),
      company: 'Fortum',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: companies.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return CompaniesCard(
          cardLogo: companies[index].logo,
          cardTitle: companies[index].company,
        );
      },
    );
  }
}
