import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/widgets/tabs_card.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/services/firebase_storage_service.dart';

class TabList extends StatelessWidget {
  final int tabIndex;
  TabList({this.tabIndex});
  @override
  Widget build(BuildContext context) {
    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    print(program.length);

    return Tab(
      text: '${program[tabIndex].tabTitle}',
    );
  }
}
