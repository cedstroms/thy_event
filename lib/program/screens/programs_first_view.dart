//import 'package:thyevent/program/widgets/program_list.dart';
//
//class FirstView extends StatelessWidget {
//  final List<String> favouriteList;
//
//  FirstView({this.favouriteList});
//
//  @override
//  Widget build(BuildContext context) {
//    final program = Provider.of<List<ProgramItem>>(context) ?? [];
//    final List<ProgramItem> programList = [];
//    for (int i = 0; i < program.length; i++) {
//      if (program[i].tabNumber == 1) {
//        programList.add(program[i]);
//      }
//    }
//    return ProgramList(
//      program: programList,
//      favouriteList: favouriteList,
//    );
//  }
//}
