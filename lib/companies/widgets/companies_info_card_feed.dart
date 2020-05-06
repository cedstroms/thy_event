import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class CompaniesInfoCardFeed extends StatelessWidget {
  final String header;
  final List<FeedItem> feed;

  CompaniesInfoCardFeed({this.header, this.feed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feed.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                  child: Divider(),
                ),
                Container(
                  color: Theme.of(context).cardColor,
                  child: Column(children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Container(
                          child: SvgPicture.network(feed[index].logo),
                          margin: EdgeInsets.all(7),
                          color: Colors.transparent,
                        ),
                        radius: 20,
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                        feed[index].author,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(feed[index].date),
                    ),
                    Text(
                      feed[index].content,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ]);
      },
    );
  }
}
