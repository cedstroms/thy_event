import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class FeedCard extends StatelessWidget {
  final FeedItem feed;
  final CompaniesItem company;

  FeedCard({this.feed, this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      color: Theme
          .of(context)
          .cardColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Container(
                  child: SvgPicture.network(feed.feedLogo),
                  margin: EdgeInsets.all(7),
                  color: Colors.transparent,
                ),
                radius: 20,
                backgroundColor: Colors.white,
              ),
              title: Text(
                feed.feedAuthor,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(feed.feedDate),
              onTap: () {
                //TODO: implementera vidarebefordring till company view
                print('pressed: company on feed card');
              },
              trailing: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  //TODO: implementera funktion att dela feed post?
                  print('pressed: feed share button');
                },
              ),
            ),
            Text(
              feed.feedContent,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
