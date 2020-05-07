import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/feed/models/feed_filter_item.dart';
import 'package:thyevent/feed/widgets/feed_filter_card.dart';
import 'package:thyevent/companies/widgets/companies_list.dart';
import 'package:thyevent/companies/screens/companies_info_screen.dart';

import '../../companies/models/companies_item.dart';
import '../../companies/models/companies_item.dart';
import '../../companies/models/companies_item.dart';
import '../models/feed_filter_item.dart';
import '../models/feed_filter_item.dart';
import '../models/feed_item.dart';
import '../screens/feed_screen.dart';
import '../screens/feed_screen.dart';
import 'feed_filter_card.dart';
import 'feed_filter_card.dart';
import 'feed_filter_card.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class FeedFilterList extends StatefulWidget {
  @override
  _FeedFilterListState createState() => _FeedFilterListState();
}

List<Widget> filterList;

class _FeedFilterListState extends State<FeedFilterList> {
  List<FeedFilterItem> filters = [
    FeedFilterItem(
      logo: Icon(Icons.home, size: 40, color: Colors.blueAccent),
      title: 'Home',
      subtitle: 'Shows all posts unfiltered',
      onPressed: () {
        print('feedfilterlist - to home screen');
      },
    ),
    FeedFilterItem(
      logo: Icon(Icons.alternate_email, size: 40, color: Colors.green),
      title: 'Official Statements',
      subtitle: 'Shows all statements by the arrangers',
      onPressed: () {
        print('feedfilterlist - to offical screen');
      },
    ),
    FeedFilterItem(
      logo: Icon(Icons.star, size: 40, color: Colors.yellow),
      title: 'Favourited',
      subtitle: 'Shows all posts from your favourited items',
      onPressed: () {
        print('feedfilterlist - to favourite screen');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //makes the whole screen scrollable
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];
    List<CompaniesItem> favouritesList = [];

    return Consumer<FeedProperties>(builder: (context, feedData, child) {
      return Consumer<CompaniesProvider>(
          builder: (context, companiesData, child) {
            for (var company in companies) {
              if (companiesData.listOfFavourites.contains(company.name)) {
                favouritesList.add(company);
              }
            }
            return ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      shrinkWrap: true,
                      itemCount: filters.length,
                      // But this below disables scrollability for the separate lists
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FeedFilterCard(
                          feedFilter: filters[index],
                          onPressed: () {
                            //TODO push to relevant filter
                            if (filters[index].title == 'Home') {
                              FeedProperties.filterID = 0;
                              Navigator.pop(context);
                            }
                            else
                            if (filters[index].title == 'Official Statements') {
                              FeedProperties.filterID = 1;
                              Navigator.pop(context);
                            } else if (filters[index].title == 'Favourited') {
                              FeedProperties.filterID = 2;
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Theme
                              .of(context)
                              .dividerColor),
                          top: BorderSide(color: Theme
                              .of(context)
                              .dividerColor),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 15.0, bottom: 4.0),
                        child: Text(
                          'FAVOURITE COMPANIES',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      shrinkWrap: true,
                      itemCount: favouritesList.length,//companiesData.listOfFavourites.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FeedFilterCardCompactNew(
                          company: favouritesList[index],
                          favourite: () {
                            //push to the relevant companies info screen
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        CompaniesInfoScreen(favouritesList[index])));
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            );
          });
    });
  }
}
