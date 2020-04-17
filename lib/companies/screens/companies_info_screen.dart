import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class CompaniesInfoScreen extends StatelessWidget {
  final CompaniesItem company;

  CompaniesInfoScreen(this.company);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          company.name,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Text(company.content),
      ),
    );
  }
}
