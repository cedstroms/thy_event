import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/feed_filter_item.dart';

import '../../companies/models/companies_item.dart';

class FeedFilterCard extends StatelessWidget {
  final FeedFilterItem feedFilter;
  final Function onPressed;

  FeedFilterCard({this.feedFilter, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        enabled: true,
        leading: feedFilter.logo,
        title: Text(
          feedFilter.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(feedFilter.subtitle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onPressed,
//    () {
//          // TODO: Implement the filters, now only pushing to Feed Screen
//          //Navigator.pop(context);
//        },
      ),
    );
  }
}

class FeedFilterCardCompact extends StatelessWidget {
  final FeedFilterItemCompact feedFilter;

  FeedFilterCardCompact(this.feedFilter);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        enabled: true,
        dense: true,
        title: Text(
          feedFilter.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

class GeneralFeedFilterCard extends StatelessWidget {
  final FeedFilterItemCompact feedFilter;

  GeneralFeedFilterCard(this.feedFilter);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        enabled: true,
        dense: true,
        title: Text(
          feedFilter.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

class FeedFilterCardCompactNew extends StatelessWidget {
  final CompaniesItem company;
  final Function favourite;

  FeedFilterCardCompactNew({this.company, this.favourite});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListTile(
        enabled: true,
        dense: true,
        title: Text(
          company.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
                Icons.star,
                size: 20,
                color: Colors.yellow,
              ),
        onTap: favourite,
      ),
    );
  }
}
