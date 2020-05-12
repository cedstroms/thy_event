import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:thyevent/program/widgets/program_info_list.dart';


class ProgramInfoScreen extends StatefulWidget {
  final ProgramItem program;

  ProgramInfoScreen(this.program);

  @override
  _ProgramInfoScreenState createState() => _ProgramInfoScreenState();
}

class _ProgramInfoScreenState extends State<ProgramInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProgramProvider>(
        builder: (context, programData, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  widget.program.title),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: !programData.listOfFavouriteP
                      .contains(widget.program.title)
                      ? Icon(Icons.star_border)
                      : Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    programData.updateFavourite(widget.program);
                    setState(() {});
                  },
                ),
              ],
            ),
            body: ProgramInfoList(widget.program),
          );
        });
  }
}
