import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_list.dart';

class SecondView extends StatelessWidget {
  final List<String> favouriteList;

  SecondView({this.favouriteList});
  @override
  Widget build(BuildContext context) {
    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    final List<ProgramItem> programList = [];
    for (int i = 0; i < program.length; i++) {
      if (program[i].tabNumber == 2) {
        programList.add(program[i]);
      }
    }
    return ProgramList(
      program: programList,
      favouriteList: favouriteList,);
  }
}
