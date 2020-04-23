import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:provider/provider.dart';

class FeedCard extends StatelessWidget {
  final FeedItem feed;
  final Function onPressedCallbackShowMore;

  FeedCard({this.feed, this.onPressedCallbackShowMore});

  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Container(
                  child: SvgPicture.network(feed.logo),
                  margin: EdgeInsets.all(7),
                  color: Colors.transparent,
                ),
                radius: 20,
                backgroundColor: Colors.white,
              ),
              title: Text(
                feed.author,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(feed.date),
              onTap: () {
                //TODO: implementera vidarebefordring till company view
                print('${feed.authorID}');
                for (int i = 0; i < companies.length; i++) {
                  if (feed.authorID == companies[i].companyId) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                CompaniesInfoScreen(companies[i])));
                    print(i);
                  }
                }
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
              feed.content,
              maxLines: feed.showMore ? 100 : 3,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
            feed.content.length < 280
                ? Container()
                : InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          feed.showMore ? "show less" : "show more",
                          style: new TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    onTap: onPressedCallbackShowMore,
                  )
          ],
        ),
      ),
    );
  }
}
