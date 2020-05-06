import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/companies/widgets/companies_info_list.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

import '../models/companies_item.dart';

class CompaniesInfoScreen extends StatefulWidget {
  final CompaniesItem company;

  CompaniesInfoScreen(this.company);

  @override
  _CompaniesInfoScreenState createState() => _CompaniesInfoScreenState();
}

class _CompaniesInfoScreenState extends State<CompaniesInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CompaniesProvider>(
        builder: (context, companiesData, child) {
      return StreamProvider<List<FeedItem>>.value(
        value: DatabaseService().feed,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.company.name,
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: !companiesData.listOfFavourites.contains(widget.company.name)
                    ? Icon(Icons.star_border)
                    : Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                onPressed: () {
                  print(widget.company.name);
                  companiesData.updateFavourite(widget.company);
                  setState(() {
                  });
                  },
              ),
            ],
          ),
          body: CompaniesInfoList(widget.company),
          // make feeds relevant appear
        ),
      );
    });
  }
}
