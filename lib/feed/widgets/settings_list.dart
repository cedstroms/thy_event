import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thyevent/feed/models/settings_item.dart';
import 'package:thyevent/feed/widgets/settings_card.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/common/theme.dart';

class SettingsList extends StatefulWidget {
  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
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

  List<SettingsItemCompact> settingsCompactGeneral = [
    SettingsItemCompact(
      title: 'About Us',
    ),
    SettingsItemCompact(
      title: 'Enviromental Policies',
    ),
    SettingsItemCompact(
      title: 'Contact Information',
    ),
    SettingsItemCompact(
      title: 'Location Information',
    ),
  ];
  List<SettingsItemCompact> settingsCompactApplication = [
    SettingsItemCompact(
      title: 'Language',
    ),
    SettingsItemCompact(
      title: 'Light/Dark Theme',
    ),
    SettingsItemCompact(
      title: 'Surveys',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Theme
              .of(context)
              .cardColor,
          child: FlatButton(
            child: Text('Dark Theme'),
            onPressed: () => _themeChanger.setTheme(1),
          ),
        ),
        Container(
          color: Theme
              .of(context)
              .cardColor,
          child: FlatButton(
            child: Text('Light Theme'),
            onPressed: () => _themeChanger.setTheme(0),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme
                    .of(context)
                    .dividerColor)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
            child: Text(
              'GENERAL',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: settingsCompactGeneral.length,
          itemBuilder: (context, index) {
            return SettingsCardCompact(
              cardTitle: settingsCompactGeneral[index].title,
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme
                    .of(context)
                    .dividerColor)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
            child: Text(
              'NOTIFICATIONS',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filters.length,
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
                bottom: BorderSide(color: Theme
                    .of(context)
                    .dividerColor)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 4.0),
            child: Text(
              'APPLICATION',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: settingsCompactApplication.length,
          itemBuilder: (context, index) {
            return SettingsCardCompact(
              cardTitle: settingsCompactApplication[index].title,
            );
          },
        ),
      ],
    );
  }
}
