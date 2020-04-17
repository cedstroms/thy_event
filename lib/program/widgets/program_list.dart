import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    //The first layer of the program-box and take the information from database and sends it to the "in
    return ListView.separated(
      itemCount: program.length,
      itemBuilder: (context, index) {
        return ProgramCard(
          startTime: program[index].startTime,
          stopTime: program[index].stopTime,
          title: program[index].title,
          subTitle: program[index].subTitle,
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
