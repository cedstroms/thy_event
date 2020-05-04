import 'package:flutter/material.dart';
import 'package:thyevent/services/shared_preferences.dart';

class ProgramItem {
  final String startTime;
  final String endTime;
  final String title;
  final String subTitle;
  final String tabTitle;
  final int tabNumber;
  bool isFavourite = false;

  ProgramItem(
      {this.startTime,
      this.endTime,
      this.title,
      this.subTitle,
      this.tabNumber,
      this.tabTitle,
      this.isFavourite});
}

class ProgramProvider extends ChangeNotifier {
  static bool favourite = false;
  void updateFavourite(ProgramItem program, List insideList) {
    if (!insideList.contains(program.title)) {
      programAdder(program, insideList);
    } else {
      programRemover(program, insideList);
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
    print(favourite);
    notifyListeners();
  }
}