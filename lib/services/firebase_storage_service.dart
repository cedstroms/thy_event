import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DatabaseService {
  // companies and feed join collection

  // companies collection reference
  final CollectionReference companiesCollection =
      Firestore.instance.collection('companies');

  // feed collection query
  final Query feedCollection =
      Firestore.instance.collection('feed').orderBy('date', descending: true);

  // companies list from snapshot
  List<CompaniesItem> _companiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return CompaniesItem(
          logo: doc.data['logo'] ?? '',
          name: doc.data['name'] ?? '',
          content: doc.data['desc'] ?? '',
          links: doc.data['links'] ?? {},
          tags: doc.data['tags'] ?? [],
        );
      },
    ).toList();
  }

  // feed list from snapshot
  List<FeedItem> _feedListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return FeedItem(
          feedLogo: doc.data['logo'] ?? '',
          feedAuthor: doc.data['company_name'] ?? '',
          feedContent: doc.data['content'] ?? '',
          feedDate: DateFormat.Hm()
                  .add_MMMMEEEEd()
                  .format(doc.data['date'].toDate()) ??
              '',
        );
      },
    ).toList();
  }

  // get companies stream
  Stream<List<CompaniesItem>> get companies {
    return companiesCollection.snapshots().map(_companiesListFromSnapshot);
  }

  // get feed stream
  Stream<List<FeedItem>> get feed {
    return feedCollection.snapshots().map(_feedListFromSnapshot);
  }

  // Program collection reference, finds the collection in firebase database.
  final Query programCollection = Firestore.instance
      .collection('program')
//      .where(
//        'number_tab',
//        isEqualTo: getTabNumber(),
//      )
      .orderBy('start_time');
  // Program list from snapshot
  List<ProgramItem> _programListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        // returns the data that is in the collection.
        return ProgramItem(
          startTime:
              DateFormat.Hm().format(doc.data['start_time'].toDate()) ?? '',
          stopTime:
              DateFormat.Hm().format(doc.data['stop_time'].toDate()) ?? '',
          title: doc.data['title'] ?? '',
          subTitle: doc.data['sub_title'] ?? '',
          numberTab: doc.data['number_tab'] ?? 0,
          tabTitle: doc.data['tab_title'] ?? '',
        );
      },
    ).toList();
  }

  // get program stream
  Stream<List<ProgramItem>> get program {
    return programCollection.snapshots().map(_programListFromSnapshot);
  }

  // int get getTabNumber {}

//  int get tabCount {
//    for (int i = 0; i < ; i++) {
//      programCollection.where('number_tab', isEqualTo: i);
//      //tabList.add(program[i].numberTab);
//    }
//    return (Set.from(tabList).length);
//  }
//
//  int await(Future<int> program) {
//    int count= program.length;
//
//
//  }

//  Future<int> get tabCount async{
//    _Future<int> future=new _Future<int>();
//    int count =0;
//    this.program.listen((_){
//      count++;
//    },
//    onError: future._completeError,
//    onDone: (){
//      future._complete(count);
//    },
//    cancelOnError: true,
//    );
//    return future;
//    List tabList = [];
//     await for (int i = 0; i < program.length; i++) {
//      tabList.add(program[i].numberTab);
//    }
//    return (Set.from(tabList).length);
//  }
}
