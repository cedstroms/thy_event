import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedFilterCard extends StatelessWidget {
  final Icon cardLogo;
  final String cardTitle;
  final String cardSubtitle;

  FeedFilterCard({this.cardLogo, this.cardTitle, this.cardSubtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xffDCDCDC))),
      ),
      child: ListTile(
        enabled: true,
        leading: cardLogo,
        title: Text(
          cardTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(cardSubtitle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          // TODO: Implement the filters, now only pushing to Feed Screen
          Navigator.pop(context);
        },
      ),
    );
  }
}
