import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/companies/widgets/companies_info_card.dart';
import 'package:thyevent/feed/models/feed_item.dart';


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
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Container(
                  child: SvgPicture.network(company.logo),
                  margin: EdgeInsets.all(14),
                  color: Colors.transparent,
                ),
              ),
              SizedBox(height: 20.0,),
              CompaniesInfoCard(header: company.name, content: company.content),
              CompaniesInfoCard(header: 'About Us', content: 'raves'),
              CompaniesInfoCard(header: 'Links', content: 'Facebook, LinkedIn'),
              CompaniesInfoCard(header: 'Tags', content: 'Haschtags'),
              // make feeds relevant appear
              //CompaniesInfoCard(header: feed,)
            ],
          ),
        ),
    );
  }
}