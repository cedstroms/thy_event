import 'package:flutter/material.dart';
import 'package:thyevent/program/screens/programs_screen.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/services/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../models/program_item.dart';
import '../models/program_item.dart';
import '../models/program_item.dart';
import '../models/program_item.dart';
import '../models/program_item.dart';

class ProgramList extends StatefulWidget {
  final List<ProgramItem> program;
  final List<String> favouriteList;
  ProgramList({this.program, this.favouriteList});

  @override
  _ProgramListState createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {
  List<String> outsideListPrograms = [];
  void getStringListPrograms() async {
    var tempList = await SharedPreferencesHelper.getProgramNames();
    outsideListPrograms = tempList;
  }

  @override
  Widget build(BuildContext context) {
    getStringListPrograms();
    List<ProgramItem> favouritesListPrograms = [];
    List<String> insideListPrograms = outsideListPrograms;
    //List of companies provided by the database
    final programs = Provider.of<List<ProgramItem>>(context) ?? [];

    //Create a list of ProgramItems that are marked favourites
    for (var i = 0; i < programs.length; i++) {
      if (insideListPrograms.contains(programs[i].title)) {
        favouritesListPrograms.add(programs[i]);
      }
    }
    return Consumer<ProgramProvider>(builder: (context, programData, child) {
      return programData.getFavouriteState()
          ? ListView.separated(
              itemCount: widget.program.length,
              itemBuilder: (context, index) {
                return ProgramCard(
                  program: favouritesListPrograms[index],
                  favourite: () async {
                    print(insideListPrograms);
                    getStringListPrograms();
                    programData
                        .updateFavourite(favouritesListPrograms[index], insideListPrograms);
                  },
                  favouriteList: insideListPrograms,
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            )
          : ListView.separated(
              itemCount: widget.program.length,
              itemBuilder: (context, index) {
                return ProgramCard(
                  program: widget.program[index],
                  favourite: () async {
                    print(insideListPrograms);
                    getStringListPrograms();
                    List<String> tempList =
                        await SharedPreferencesHelper.getProgramNames();
                    programData
                        .updateFavourite(programs[index], insideListPrograms);
                  },
                  favouriteList: insideListPrograms,
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
    });
  }
}
