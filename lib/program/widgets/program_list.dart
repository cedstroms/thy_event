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
    getStringListPrograms();
    List<String> dayList = [];
    List<ProgramItem> favouritesListPrograms = [];
    List<String> insideListPrograms = outsideListPrograms;

    //List of companies provided by the database
    final programs = Provider.of<List<ProgramItem>>(context) ?? [];

    // Set the list parameter to the SharedPref-list
    for (var program in programs) {
      program.favouritePrograms = insideListPrograms;
    }

    //Create a list of ProgramItems that are marked favourites
    for (var i = 0; i < programs.length; i++) {
      if (insideListPrograms.contains(programs[i].title)) {
        favouritesListPrograms.add(programs[i]);
      }
    }
    // Create a list of programs separated by date
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
          //Check if we want to build the list with favorites or see every item in the Schedule
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
                      favourite: () {
//                        getStringListPrograms();
                        programData.updateFavourite(
                            favouritesListPrograms[index]);
                        setState(() {});
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
                      favourite: () {
                        programData.updateFavourite(programs[index]);
                        setState(() {});
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
