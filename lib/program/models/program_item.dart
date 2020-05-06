import 'package:flutter/material.dart';
import 'package:thyevent/services/shared_preferences.dart';

class ProgramItem {
  final String startTimeOnlyTime;
  final String endTimeOnlyTime;
  final String title;
  final String subTitle;
  final String tabTitle;
  final int tabNumber;
  bool isFavourite = false;
  final String startDay;

  ProgramItem({this.startTimeOnlyTime,
    this.endTimeOnlyTime,
      this.title,
      this.subTitle,
      this.tabNumber,
      this.tabTitle,
    this.isFavourite,
    this.startDay});
}

class ProgramProvider extends ChangeNotifier {
  static bool favourite = false;
  void updateFavourite(ProgramItem program, List insideListPrograms) {
    if (!insideListPrograms.contains(program.title)) {
      programAdder(program, insideListPrograms);
    } else {
      programRemover(program, insideListPrograms);
    }
    notifyListeners();
  }

  void programAdder(ProgramItem program, List insideList) {
    SharedPreferencesHelper.addProgramNames([program.title]);
    insideList.add(program.title);
    program.isFavourite = true;
    notifyListeners();
  }

  void programRemover(ProgramItem program, List insideList) {
    SharedPreferencesHelper.removeProgramNames([program.title]);
    insideList.remove(program.title);
    program.isFavourite = false;
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