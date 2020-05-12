import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_info_card.dart';

class ProgramInfoList extends StatelessWidget {
  final ProgramItem program;

  ProgramInfoList(this.program);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ProgramInfoCard(
          header: program.title,
          content: Text(program.desc),
          location: program.subTitle,
          startTime: program.startTimeOnlyTime,
          endTime: program.endTimeOnlyTime,
        )
      ],
    );
  }
}
