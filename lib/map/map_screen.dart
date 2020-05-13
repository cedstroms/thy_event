import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://d38trduahtodj3.cloudfront.net/images.ashx?t=ig&rid=GreeleyStampede&i=2019_Greeley_Stampede_park_map_061219(1).png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Hello'),
        onPressed: (){
          print('Hello there');
        },
      ),
    );
  }
}
