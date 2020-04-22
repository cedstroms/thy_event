import 'package:flutter/material.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramList extends StatelessWidget {
  final List<ProgramItem> program;

  ProgramList(this.program);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: program.length,
      itemBuilder: (context, index) {
        return ProgramCard(program[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
