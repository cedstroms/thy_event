import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

import 'location_card.dart';
import 'location_item.dart';

class LocationGeneralScreen extends StatelessWidget {
  LocationGeneralScreen();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LocationItem>>.value(
        value: DatabaseService().location,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Event Location'),
              centerTitle: true,
            ),
            body: LocationCard()));
  }
}
