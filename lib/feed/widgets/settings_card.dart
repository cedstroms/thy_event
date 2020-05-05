import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/widgets/setting_general/information_general_screen.dart';
import 'settings_switch.dart';
import 'theme_switch.dart';

class SettingsCardSwitch extends StatelessWidget {
  final Icon cardLogo;
  final String cardTitle;
  final String cardSubtitle;
  final Function onPressed;
  final Function isToggled;

  SettingsCardSwitch(
      {this.cardLogo,
      this.cardTitle,
      this.cardSubtitle,
      this.onPressed,
      this.isToggled});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
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
  final bool hasSwitch;
  final List<CompaniesItem> companies;

  SettingsCardCompact(
      {this.cardTitle, this.cardSubtitle, this.hasSwitch, this.companies});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: ListTile(
        enabled: true,
        dense: true,
        onTap: () {
          for (int i = 0; i < companies.length; i++) {
            if (companies[i].companyId == 0) {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          InformationGeneralScreen(companies[i])));
            }
          }
        },
        title: Text(
          cardTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: hasSwitch
            ? ThemeSwitch()
            : IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                iconSize: 16,
                color: Colors.grey,
                onPressed: () {
                  for (int i = 0; i < companies.length; i++) {
                    if (companies[i].companyId == 0) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  InformationGeneralScreen(companies[i])));
                    }
                  }
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
        color: Theme.of(context).cardColor,
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: ListTile(
        enabled: false,
        dense: true,
        title: Text(
          cardTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: ThemeSwitch(),
      ),
    );
  }
}
