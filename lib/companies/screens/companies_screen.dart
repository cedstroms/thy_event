import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/widgets/companies_list.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/common/settings_screen.dart';

class CompaniesScreen extends StatelessWidget {
  static const String id = 'companies_screen';

  @override
  Widget build(BuildContext context) {
    //TODO används denna
    var filterShowFavorites = Provider.of<FavouriteProvider>(context);

    return StreamProvider<List<FeedItem>>.value(
      value: DatabaseService().feed,
      child: StreamProvider<List<CompaniesItem>>.value(
        value: DatabaseService().companies,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Companies',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                // TODO filter the companies to your favourites¨
                FavouriteProvider().toggleShowFavouriteFilter();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: CompaniesList(),
          ),
        ),
      ),
    );
  }
}

class FavouriteProvider with ChangeNotifier {
  static bool showFavourites = true;
  void toggleShowFavouriteFilter() {
    showFavourites = !showFavourites;
    print(showFavourites);

    print('FavoriteProvider i com_screen $showFavourites');
    notifyListeners();
  }

  bool returnShowFavouriteFilter() {
    return showFavourites;
  }
}
