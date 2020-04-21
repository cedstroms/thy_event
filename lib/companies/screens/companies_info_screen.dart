import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/companies/widgets/companies_info_list.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              print('pressed: mark as favourite');
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: SvgPicture.network(company.logo),
              ),
            ),
            CompaniesInfoList(company),
            // make feeds relevant appear
            //CompaniesInfoCard(header: feed,)
          ],
        ),
      ),
    );
  }
}
