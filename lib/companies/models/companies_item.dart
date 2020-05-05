import 'package:flutter/material.dart';
import 'package:thyevent/services/shared_preferences.dart';

class CompaniesItem {
  final String logo;
  final String name;
  final String content;
  final Map links;
  final List tags;
  final int companyId;
  bool isFavourite;
  final String contactInfo;
  List<String> listOfFavourites; //TODO ta bort detta städa yada

  CompaniesItem(
      {this.logo,
      this.name,
      this.content,
      this.links,
      this.tags,
      this.companyId,
      this.isFavourite,
      this.contactInfo,
      this.listOfFavourites});

//  List<String> tempList;
//  void getStringList() async {
//    tempList = await SharedPreferencesHelper.getCompanyNames();
//  }
//  void setFavouriteList () {
//    listOfFavourites = tempList;
//  }
}

class CompaniesProvider extends ChangeNotifier {
  static bool favourite = false;
  List<String> listOfFavourites;

  void getStringList() async {
    var tempList = await SharedPreferencesHelper.getCompanyNames();
    listOfFavourites = tempList;
  }

  void updateFavourite(CompaniesItem company, List insideList) {
    getStringList();
    print('$listOfFavourites from provider');
    if (!insideList.contains(company.name)) {
      companyAdder(company, insideList);
      //companyAdder(company, company.listOfFavourites);
    } else {
      companyRemover(company, insideList);
      //companyRemover(company, company.listOfFavourites);
    }
    notifyListeners();
  }

  void companyAdder(CompaniesItem company, List insideList) {
    SharedPreferencesHelper.addCompanyNames([company.name]);
    insideList.add(company.name);
    company.isFavourite = true;
    notifyListeners();
  }

  void companyRemover(CompaniesItem company, List insideList) {
    SharedPreferencesHelper.removeCompanyNames([company.name]);
    insideList.remove(company.name);
    company.isFavourite = false;
    notifyListeners();
  }

  bool getFavouriteState() {
    return !favourite;
  }

  void toggleShowFavouriteFilter() {
    favourite = !favourite;
    print(favourite);
    notifyListeners();
  }
}
