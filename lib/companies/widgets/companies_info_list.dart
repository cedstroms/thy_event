import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_info_card.dart';
import 'package:thyevent/companies/widgets/companies_info_card_feed.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'companies_info_card_links.dart';

class CompaniesInfoList extends StatelessWidget {
  final CompaniesItem company;
  CompaniesInfoList(this.company);

  getList(List<FeedItem> feed) {
    List<FeedItem> feedList = [];
    for (int i = 0; i < feed.length; i++) {
      if (company.companyId == feed[i].authorID) {
        feedList.add(feed[i]);
      }
    }
    return feedList;
  }

  @override
  Widget build(BuildContext context) {
    final feed = Provider.of<List<FeedItem>>(context) ?? [];
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.network(company.logo),
          ),
        ),
        CompaniesInfoCard(
          header: 'About Us',
          content: Text(
            company.content,
            textAlign: TextAlign.left,
          ),
        ),
        CompaniesInfoCardLinks(
          header: 'links',
          links: company.links,
        ),
        CompaniesInfoCard(
          header: 'tags',
          content: Text(company.tags.toString()),
        ),
        CompaniesInfoCardFeed(feed: getList(feed)),
      ],
    );
  }
}
