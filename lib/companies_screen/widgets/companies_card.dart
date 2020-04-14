import 'package:flutter/material.dart';

class CompaniesCard extends StatelessWidget {
  final String cardLogo;
  final String cardTitle;

  CompaniesCard({this.cardLogo, this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            child: Container(
              child: Image.network(cardLogo),
              margin: EdgeInsets.all(14),
              color: Colors.transparent,
            ),
            radius: 40,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            cardTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
