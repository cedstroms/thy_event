import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'about_us_list.dart';

class InformationGeneralScreen extends StatelessWidget {
  final CompaniesItem company;

  InformationGeneralScreen(this.company);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<FeedItem>>.value(
      value: DatabaseService().feed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            company.name,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                print('pressed: mark as favourite');
              },
            ),
          ],
        ),
        body: AboutUsList(company),
        // make feeds relevant appear
      ),
    );
  }
}
