import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/feed/widgets/feed_list.dart';
import 'package:provider/provider.dart';

class FeedCard extends StatelessWidget {
  final FeedItem feed;
  final Function onPressedCallbackShowMore;

  FeedCard({this.feed, this.onPressedCallbackShowMore});
  @override
  Widget build(BuildContext context) {
//    final showMoreProvider =
//        Provider.of<ShowLessShowMore>(context, listen: false);
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
              trailing: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  //popup?
                },
              ),
            ),
            Text(
              feed.feedContent,
              maxLines: feed.showMore ? 100 : 3,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  //TODO Om det inte finns möjlighet att visa mer text så ska knappen inte finnas.
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
