import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/feed/widgets/setting_general/location_item.dart';

class LocationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationList = Provider.of<List<LocationItem>>(context) ?? [];
    final location = locationList[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Location Description',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  child: Divider(),
                ),
                Text(
                  '${location.information}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Theme.of(context).cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Adress',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  child: Divider(),
                ),
                Text(
                  '${location.adress}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () => MapsLauncher.launchQuery('${location.adress}'),
            child: Column(
              children: <Widget>[
                FaIcon(
                  FontAwesomeIcons.map,
                  size: 30,
                ),
                Text(
                  'Get Here',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
//TODO ta bort om vi bangar koordinater
//            RaisedButton(
//              onPressed: () => MapsLauncher.launchCoordinates(
//                  59.840748, 17.650387, 'Place of the event '),
//              child: Text('LAUNCH COORDINATES'),
//            ),
        ],
      ),
    );
  }
}
