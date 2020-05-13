import 'package:flutter/material.dart';
import 'package:thyevent/services/shared_preferences.dart';

class ProgramItem {
  final String startTimeOnlyTime;
  final String endTimeOnlyTime;
  final String title;
  final String subTitle;
  final String tabTitle;
  final int tabNumber;
  final String desc;
  bool isFavourite = false;
  final String startDay;
  List<String> favouritePrograms;

  ProgramItem(
      {this.startTimeOnlyTime,
      this.endTimeOnlyTime,
      this.title,
      this.subTitle,
      this.tabNumber,
      this.tabTitle,
      this.desc,
      this.isFavourite,
      this.startDay,
      this.favouritePrograms});
}

class ProgramProvider extends ChangeNotifier {
  static bool favourite = false;
  List<String> listOfFavouriteP = [];

  void getStringListPrograms() async {
    var tempList = await SharedPreferencesHelper.getProgramNames();
    listOfFavouriteP = tempList;
  }

  void updateFavourite(ProgramItem program) {
    if (!listOfFavouriteP.contains(program.title)) {
      programAdder(program, listOfFavouriteP);
    } else {
      programRemover(program, listOfFavouriteP);
    }
//    notifyListeners();
  }

  void programAdder(ProgramItem program, List list) {
    SharedPreferencesHelper.addProgramNames([program.title]);
    program.isFavourite = true;
    listOfFavouriteP.add(program.title);
    notifyListeners();
  }

  void programRemover(ProgramItem program, List list) {
    SharedPreferencesHelper.removeProgramNames([program.title]);
    program.isFavourite = false;
    listOfFavouriteP.remove(program.title);
    notifyListeners();
  }

  bool getFavouriteState() {
    return favourite;
  }

  void toggleShowFavouriteFilter() {
    favourite = !favourite;
    notifyListeners();
  }
}
