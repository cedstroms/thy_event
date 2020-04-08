import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedFilterCardCompact extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;

  FeedFilterCardCompact({this.cardTitle, this.cardSubtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xffDCDCDC))),
      ),
      child: ListTile(
        enabled: true,
        dense: true,
        title: Text(
          cardTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.star,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
