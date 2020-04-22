import 'package:flutter/material.dart';

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
      this.isFavourite = false});

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }

}

class CompaniesProvider extends ChangeNotifier {

  void updateFavourite(CompaniesItem company){
    print('in update favourite');
    company.toggleFavourite();
    notifyListeners();
  }

}
