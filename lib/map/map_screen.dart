import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Container(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('hej');
        },
      ),
    );
  }
}
