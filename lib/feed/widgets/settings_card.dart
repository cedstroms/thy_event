import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings_switch.dart';

class SettingsCardSwitch extends StatelessWidget {
  final Icon cardLogo;
  final String cardTitle;
  final String cardSubtitle;
  final Function onPressed;
  final Function isToggled;

  SettingsCardSwitch({this.cardLogo, this.cardTitle, this.cardSubtitle, this.onPressed, this.isToggled});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .cardColor,
        border: Border(bottom: BorderSide(color: Theme
            .of(context)
            .dividerColor)),
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
        trailing: SettingsSwitch(),
      ),
    );
  }
}


class SettingsCardCompact extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;

  SettingsCardCompact({this.cardTitle, this.cardSubtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .cardColor,
        border: Border(bottom: BorderSide(color: Theme
            .of(context)
            .dividerColor)),
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
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          iconSize: 16,
          color: Colors.grey,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class SettingsCardCompactSwitch extends StatelessWidget {
  final String cardTitle;
  final String cardSubtitle;

  SettingsCardCompactSwitch({this.cardTitle, this.cardSubtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .cardColor,
        border: Border(bottom: BorderSide(color: Theme
            .of(context)
            .dividerColor)),
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
        trailing: SettingsSwitch(),
      ),
    );
  }
}


