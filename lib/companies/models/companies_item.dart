import 'package:flutter/material.dart';
import 'package:thyevent/services/shared_preferences.dart';

class CompaniesItem {
  final String logo;
  final String name;
  final String content;
  final Map links;
  final List tags;
  final int companyId;
  bool isHidden;
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
        this.isHidden,
      this.isFavourite,
      this.contactInfo,
      this.listOfFavourites});
}

class CompaniesProvider extends ChangeNotifier {
  static bool favourite = false;
  List<String> listOfFavourites;
  List<CompaniesItem> listOfFavouriteCompanies;

  void getStringList() async {
    var tempList = await SharedPreferencesHelper.getCompanyNames();
    listOfFavourites = tempList;
  }

  void updateFavourite(CompaniesItem company) {
    getStringList();
    if (!listOfFavourites.contains(company.name)) {
      companyAdder(company, listOfFavourites);
    } else {
      companyRemover(company, listOfFavourites);
    }
  }

  void companyAdder(CompaniesItem company, List list) {
//    getStringList();
    SharedPreferencesHelper.addCompanyNames([company.name]);
    company.isFavourite = true;
//    listOfFavourites.add(company.name);
    print('${company.name} added - in companiesItem');
    print('$listOfFavourites');
//    getStringList();
    notifyListeners();
  }

  void companyRemover(CompaniesItem company, List list) {
//    getStringList();
    SharedPreferencesHelper.removeCompanyNames([company.name]);
    company.isFavourite = false;
//    listOfFavourites.remove(company.name);
    print('${company.name} removed - in companiesItem');
//    getStringList();
    notifyListeners();
  }

  bool getFavouriteState() {
    return !favourite;
  }

  void toggleShowFavouriteFilter() {
    favourite = !favourite;
    notifyListeners();
  }
}
