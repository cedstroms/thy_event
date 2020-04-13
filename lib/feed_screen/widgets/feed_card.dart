import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final Icon cardLogo;
  final String cardTitle;
  final String cardDate;
  final String cardContent;

  FeedCard({this.cardLogo, this.cardTitle, this.cardDate, this.cardContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: cardLogo,
              title: Text(
                cardTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(cardDate),
              trailing: Icon(Icons.more_horiz),
            ),
            Text(
              cardContent,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
