import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';

class TabCard extends StatelessWidget {
  final ProgramItem program;
  TabCard(this.program);
  @override
  Widget build(BuildContext context) {
    return Tab(
      text: '$program.tabTitle',
    );
  }
}
