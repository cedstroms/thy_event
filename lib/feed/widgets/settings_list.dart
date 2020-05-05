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
//    SettingsItemCompact(
//      title: 'Contact Information',
//      hasSwitch: false,
//    ),
    SettingsItemCompact(
      title: 'Location Information',
      hasSwitch: false,
    ),
  ];
  List<SettingsItem> filters = [
    SettingsItem(
      logo: Icon(Icons.notification_important, size: 40, color: Colors.red),
      title: 'Push Notifications',
      subtitle: 'Toggle push notifications',
    ),
    SettingsItem(
      logo: Icon(Icons.near_me, size: 40, color: Colors.lightBlueAccent),
      title: 'GPS',
      subtitle: 'Enable Location Service',
    ),
  ];
  List<SettingsItemCompact> settingsCompactApplication = [
    SettingsItemCompact(
      title: 'Dark Theme',
      hasSwitch: true,
    ),
    //TODO Kan vara ett kul extra project om man pallar i slutet annars städa bort
    SettingsItemCompact(
      title: 'Surveys',
      hasSwitch: false,
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
                  'NOTIFICATIONS',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filters.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SettingsCardSwitch(
                  cardLogo: filters[index].logo,
                  cardTitle: filters[index].title,
                  cardSubtitle: filters[index].subtitle,
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
