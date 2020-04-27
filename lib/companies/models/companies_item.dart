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

  CompaniesItem(
      {this.logo,
      this.name,
      this.content,
      this.links,
      this.tags,
      this.companyId,
      this.isFavourite
      });

  void toggleFavourite(company) {
    isFavourite=!isFavourite;
  }
}

class CompaniesProvider extends ChangeNotifier {
  void updateFavourite(CompaniesItem company, List insideList) {
    //company.toggleFavourite(company);
//    company.toggleFavourite(company);
  if(!insideList.contains(company.name)) {
    companyAdder(company, insideList);
  }
  else{
    companyRemover(company, insideList);
  }
//    !company.isFavourite
//        ? SharedPreferencesHelper.addCompanyNames([company.name])
//        : SharedPreferencesHelper.removeCompanyNames([company.name]);
//    !company.isFavourite
//        ? companyAdder(company, insideList)
//        : companyRemover(company, insideList);
    notifyListeners();
  }
  void companyAdder (CompaniesItem company, List insideList){
    SharedPreferencesHelper.addCompanyNames([company.name]);
    print(company.name);
    insideList.add(company.name);
    company.isFavourite = true;
    notifyListeners();
  }
  void companyRemover (CompaniesItem company, List insideList){
    SharedPreferencesHelper.removeCompanyNames([company.name]);
    insideList.remove(company.name);
    company.isFavourite = false;
    notifyListeners();
  }
}

