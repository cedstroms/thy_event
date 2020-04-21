import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_info_card.dart';

class CompaniesInfoList extends StatelessWidget {
  final CompaniesItem company;

  CompaniesInfoList(this.company);

  linksFormatter(Map links) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: links.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (context, index) {
        String key = links.keys.elementAt(index);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              getIcon('$key'),
              size: 30,
            ),
            SizedBox(height: 4),
            Text(
              '$key'.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  getIcon(String serviceType) {
    if (serviceType == 'facebook') {
      return FontAwesomeIcons.facebookSquare;
    }
    if (serviceType == 'website') {
      return FontAwesomeIcons.externalLinkSquareAlt;
    }
    if (serviceType == 'twitter') {
      return FontAwesomeIcons.twitterSquare;
    }
    if (serviceType == 'instagram') {
      return FontAwesomeIcons.instagramSquare;
    }
    if (serviceType == 'linkedin') {
      return FontAwesomeIcons.linkedin;
    }
    return FontAwesomeIcons.square;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        CompaniesInfoCard(
          header: 'About Us',
          content: Text(
            company.content,
            textAlign: TextAlign.left,
          ),
        ),
        CompaniesInfoCard(
          header: 'links',
          content: linksFormatter(company.links),
        ),
        CompaniesInfoCard(
          header: 'tags',
          content: Text(company.tags.toString()),
        ),
      ],
    );
  }
}
