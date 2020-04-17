import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_popup/mobile_popup.dart';

class FeedCard extends StatelessWidget {
  final String cardLogo;
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
              leading: CircleAvatar(
                child: Container(
                  child: SvgPicture.network(cardLogo),
                  margin: EdgeInsets.all(7),
                  color: Colors.transparent,
                ),
                radius: 20,
                backgroundColor: Colors.white,
              ),
              title: Text(
                cardTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(cardDate),
              trailing: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: (){
                  showMobilePopup(
                    context: context,
                  builder: (context)=> MobilePopUp(
                    title: 'Hello there',
                  ));
                },
              ),
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
