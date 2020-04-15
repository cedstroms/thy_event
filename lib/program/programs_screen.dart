import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgramScreen extends StatelessWidget {
  static const String id = 'program_screen';

  @override
  Widget build(BuildContext context) {
    // TODO: build program screen
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Program',
        ),
        centerTitle: true,
        leading: Icon(Icons.filter_list),
      ),
      body: Container(
        child: Text('hej hopp gummisnopp '),
      ),
    );
  }
}
