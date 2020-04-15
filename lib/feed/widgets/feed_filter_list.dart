import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_filter_item.dart';
import 'package:thyevent/feed/widgets/feed_filter_card.dart';

class FeedFilterList extends StatefulWidget {
  @override
  _FeedFilterListState createState() => _FeedFilterListState();
}

class _FeedFilterListState extends State<FeedFilterList> {
  List<FeedFilterItem> filters = [
    FeedFilterItem(
      logo: Icon(Icons.home, size: 40, color: Colors.blueAccent),
      title: 'Home',
      subtitle: 'Shows all posts unfiltered',
    ),
    FeedFilterItem(
      logo: Icon(Icons.alternate_email, size: 40, color: Colors.green),
      title: 'Official Statements',
      subtitle: 'Shows all statements by the arrangers',
    ),
    FeedFilterItem(
      logo: Icon(Icons.star, size: 40, color: Colors.yellow),
      title: 'Favourited',
      subtitle: 'Shows all posts from your favourited items',
    ),
  ];
  List<FeedFilterItemCompact> filtersCompact = [
    FeedFilterItemCompact(
      title: 'Ericsson',
    ),
    FeedFilterItemCompact(
      title: 'SKF',
    ),
    FeedFilterItemCompact(
      title: 'SEB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            return FeedFilterCard(
              cardLogo: filters[index].logo,
              cardTitle: filters[index].title,
              cardSubtitle: filters[index].subtitle,
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffDCDCDC))),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            child: Text('COMPANIES', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filtersCompact.length,
          itemBuilder: (context, index) {
            return FeedFilterCardCompact(
              cardTitle: filtersCompact[index].title,
            );
          },
        ),
      ],
    );
  }
}
