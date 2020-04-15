import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_card.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompaniesList extends StatefulWidget {
  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<CompaniesItem> companiesData = [
    CompaniesItem(
      logo: 'assets/images/ericsson_logo.svg',
      company: 'Ericsson',
    ),
    CompaniesItem(
      logo: 'assets/images/skf_logo.svg',
      company: 'SKF',
    ),
    CompaniesItem(
      logo: 'assets/images/abb_logo.svg',
      company: 'ABB',
    ),
    CompaniesItem(
      logo: 'assets/images/hm_logo.svg',
      company: 'H&M',
    ),
    CompaniesItem(
      logo: 'assets/images/seb_logo.svg',
      company: 'SEB',
    ),
    CompaniesItem(
      logo: 'assets/images/cisco_logo.svg',
      company: 'Cisco',
    ),
    CompaniesItem(
      logo: 'assets/images/ibm_logo.svg',
      company: 'IBM',
    ),
    CompaniesItem(
      logo: 'assets/images/mtr_logo.svg',
      company: 'MTR',
    ),
    CompaniesItem(
      logo: 'assets/images/nasdaq_logo.svg',
      company: 'NASDAQ',
    ),
    CompaniesItem(
      logo: 'assets/images/ncc_logo.svg',
      company: 'NCC',
    ),
    CompaniesItem(
      logo: 'assets/images/sandvik_logo.svg',
      company: 'Sandvik',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<QuerySnapshot>(context);
    return GridView.builder(
      itemCount: companiesData.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return CompaniesCard(
          cardLogo: companiesData[index].logo,
          cardTitle: companiesData[index].company,
        );
      },
    );
  }
}
