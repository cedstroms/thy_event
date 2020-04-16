import 'package:flutter/material.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramData extends ChangeNotifier {
  List<ProgramItem> programs = [
    ProgramItem(
        startTime: '9.00',
        stopTime: '10.00',
        title: 'shdfbksjd',
        subTitle: 'fskgh',
        numberTab: 1,
        tabTitle: 'Friday'),
    ProgramItem(
        startTime: '11.00',
        stopTime: '12.00',
        title: 'Opening cermony ',
        subTitle: 'Calles Röv',
        numberTab: 1,
        tabTitle: 'Friday'),
    ProgramItem(
        startTime: '11.00',
        stopTime: '12.00',
        title: 'Opening cermony ',
        subTitle: 'Calles Röv',
        numberTab: 2,
        tabTitle: 'Saturday'),
    ProgramItem(
        startTime: '11.00',
        stopTime: '12.00',
        title: 'Opening cermony ',
        subTitle: 'Calles Röv',
        numberTab: 2,
        tabTitle: 'Saturday')
  ];

  int get tabCount {
    List tabList = [];
    int tabCounter = 0;
    for (int i = 0; i < programs.length; i++) {
      tabList.add(programs[i].numberTab);
    }
    return (Set.from(tabList).length);
  }
}
