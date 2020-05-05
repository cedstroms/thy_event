import 'package:flutter/material.dart';
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
