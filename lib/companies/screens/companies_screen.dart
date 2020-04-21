import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/widgets/companies_list.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/companies/models/companies_item.dart';

class CompaniesScreen extends StatelessWidget {
  static const String id = 'companies_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build companies screen
    return StreamProvider<List<CompaniesItem>>.value(
      value: DatabaseService().companies,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Companies',
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              print('pressed: sort by favourites');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('pressed: search companies');
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          child: CompaniesList(),
        ),
      ),
    );
  }
}
