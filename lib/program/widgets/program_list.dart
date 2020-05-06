import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/services/shared_preferences.dart';

class ProgramList extends StatefulWidget {
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
    List<String> dayList = [];
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
    Widget buildDayBanner(i, varProgram) {
      if (!dayList.contains(varProgram[i].startDay)) {
        dayList.add(varProgram[i].startDay);
        //print(dayList);
        return Container(
          padding: EdgeInsets.only(top: 8),
          margin: EdgeInsets.only(left: 8, bottom: 4),
          child: Text(
            '${varProgram[i].startDay}'.toUpperCase(),
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      } else {
        return SizedBox(
          height: 0,
        );
      }
    }

    return Consumer<ProgramProvider>(builder: (context, programData, child) {
      return programData.getFavouriteState()
      //Check if we want to build the list with favorites or se every item in the Schedule
      // Favorites list
          ? ListView.separated(
        itemCount: favouritesListPrograms.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDayBanner(index, favouritesListPrograms),
              ProgramCard(
                program: favouritesListPrograms[index],
                favourite: () async {
                  setState(() {});
                  getStringListPrograms();
                  programData.updateFavourite(
                      favouritesListPrograms[index], insideListPrograms);
                },
                favouriteList: insideListPrograms,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )
      //Every item in Schedule List
          : ListView.separated(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDayBanner(index, programs),
              ProgramCard(
                program: programs[index],
                favourite: () async {
                  setState(() {});
                  getStringListPrograms();
                  List<String> tempList =
                  await SharedPreferencesHelper.getProgramNames();
                  programData.updateFavourite(
                      programs[index], insideListPrograms);
                  print(SharedPreferencesHelper
                      .getProgramNames()
                      .runtimeType);
                },
                favouriteList: insideListPrograms,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      );
    });
  }
}
