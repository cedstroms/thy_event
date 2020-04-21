import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_list.dart';

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    final List<ProgramItem> programList = [];
    for (int i = 0; i < program.length; i++) {
      if (program[i].tabNumber == 3) {
        programList.add(program[i]);
      }
    }
    return ProgramList(programList);
  }
}
