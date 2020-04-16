import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/widgets/program_data.dart';
import 'package:thyevent/program/widgets/program_card.dart';

class ProgramList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final program=
    return Consumer<ProgramData>(builder: (context, programData, child) {
      return ListView.separated(
        itemCount: programData.programs.length,
        itemBuilder: (context, index) {
          return ProgramCard(
            startTime: programData.programs[index].startTime,
            stopTime: programData.programs[index].stopTime,
            title: programData.programs[index].title,
            subTitle: programData.programs[index].subTitle,
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      );
    });
  }
}
