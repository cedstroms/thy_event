import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/companies/widgets/companies_list.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/services/shared_preferences.dart';

import '../../main.dart';
import '../../main.dart';
import '../widgets/companies_list.dart';
import '../widgets/companies_list.dart';
import '../widgets/companies_list.dart';


class CompaniesScreen extends StatelessWidget {
  static const String id = 'companies_screen';


  @override
  Widget build(BuildContext context) {

    //bool showFavourite = false;
    var filterShowFavorites= Provider.of<FavouriteProvider>(context);
    // TODO: build companies screen
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
              onPressed: () async {
                // TODO filter the companies to your favourites¨
//                FavouriteProvider().toggleShowFavouriteFilter();
                //print(FavouriteProvider().showFavourite);
             //   print(filterShowFavorites.showFavourites);
//                filterShowFavorites.showFavourites = !filterShowFavorites.showFavourites;
                FavouriteProvider().toggleShowFavouriteFilter();

//                List<String> selectedCompanies = await SharedPreferencesHelper.getCompanyNames();
//                print(selectedCompanies);
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: CompaniesList()
          ),
        ),
      ),
    );
  }
}

class FavouriteProvider with ChangeNotifier {
//  bool showFavourites = false;
  void toggleShowFavouriteFilter(){
    //print('inside toggleShowFavouriteFilter');
//    print(showFavourites);

    notifyListeners();
  }
}
