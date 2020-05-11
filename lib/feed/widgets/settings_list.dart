import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/widgets/settings_item.dart';
import 'package:thyevent/feed/widgets/settings_card.dart';

class SettingsList extends StatefulWidget {
  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  List<SettingsItemCompact> settingsCompactGeneral = [
    SettingsItemCompact(
      title: 'About Us',
      hasSwitch: false,
    ),
    SettingsItemCompact(
      title: 'Location Information',
      hasSwitch: false,
    ),
  ];
  List<SettingsItemCompact> settingsCompactAdmin = [
    SettingsItemCompact(
      title: 'Administration Login',
      hasSwitch: false,
    )
  ];
  List<SettingsItemCompact> settingsCompactApplication = [
    SettingsItemCompact(
      title: 'Switch Theme',
      hasSwitch: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final companies = Provider.of<List<CompaniesItem>>(context) ?? [];
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
                child: Text(
                  'GENERAL',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: settingsCompactGeneral.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SettingsCardCompact(
                  cardTitle: settingsCompactGeneral[index].title,
                  hasSwitch: settingsCompactGeneral[index].hasSwitch,
                  companies: companies,
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
                child: Text(
                  'APPLICATION',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            //Application in setting items
            ListView.builder(
              shrinkWrap: true,
              itemCount: settingsCompactApplication.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SettingsCardCompact(
                  cardTitle: settingsCompactApplication[index].title,
                  hasSwitch: settingsCompactApplication[index].hasSwitch,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
