import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/widgets/companies_list.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/services/shared_preferences.dart';

import '../models/companies_item.dart';
import '../models/companies_item.dart';

class CompaniesScreen extends StatefulWidget {
  static const String id = 'companies_screen';

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  bool showFavourites = false;

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<FeedItem>>.value(
      value: DatabaseService().feed,
      child: StreamProvider<List<CompaniesItem>>.value(
        value: DatabaseService().companies,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Companies',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: CompaniesProvider().getFavouriteState()
                  ? Icon(Icons.star_border)
                  : Icon(Icons.star, color: Colors.yellow),
              onPressed: () async{ //En async låg här??
                // TODO filter the companies to your favourites
                CompaniesProvider().toggleShowFavouriteFilter();
                setState(() {

                });
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: CompaniesList(),
          ),
        ),
      ),
    );
  }
}
