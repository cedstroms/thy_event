import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/widgets/feed_filter_list.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

import '../../companies/models/companies_item.dart';

class FeedFilterScreen extends StatelessWidget {
  static String id = 'feed_filter_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build feed filter screen
    return StreamProvider<List<CompaniesItem>>.value(
      value: DatabaseService().companies,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Filter',
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.add),
            )
          ],
        ),
        body: Container(
          child: FeedFilterList(),
        ),
      ),
    );
  }
}
