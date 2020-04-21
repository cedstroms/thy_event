import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/widgets/program_card.dart';
import 'package:thyevent/program/models/program_item.dart';

class ProgramList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final program = Provider.of<List<ProgramItem>>(context) ?? [];
    // var provider = Provider.of<TabNavigationBarProvider>(context);
    //program.where(numberTab, isEqualTo: 1);
    //The first layer of the program-box and take the information from database and sends it to the "in
    return ListView.separated(
      itemCount: program.length,
      itemBuilder: (context, index) {
        //print(program[index].numberTab);
        //TODO Här måste bestämmaren för vilken tab vi har.
        return ProgramCard(
          program[index],
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
