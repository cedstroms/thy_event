import 'package:flutter/material.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramList extends StatelessWidget {
  final List<ProgramItem> program;

  ProgramList(this.program);

  @override
  Widget build(BuildContext context) {
//    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    return ListView.separated(
      itemCount: program.length,
      itemBuilder: (context, index) {
        return ProgramCard(
          startTime: program[index].startTime,
          stopTime: program[index].endTime,
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
