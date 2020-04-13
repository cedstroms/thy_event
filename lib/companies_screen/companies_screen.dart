import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompaniesScreen extends StatelessWidget {
  static const String id = 'companies_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build companies screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Companies',
        ),
        centerTitle: true,
        leading: Icon(Icons.filter_list),
      ),
      body: Container(
        child: Text('hej'),
      ),
    );
  }
}
