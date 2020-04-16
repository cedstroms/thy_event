import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/program/models/program_item.dart';

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
    print(snapshot.documents);
    return snapshot.documents.map(
      (doc) {
        return CompaniesItem(
          companyName: doc.data['name'] ?? '',
        );
      },
    ).toList();
  }

  // feed list from snapshot
  List<FeedItem> _feedListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.documents);
    return snapshot.documents.map(
      (doc) {
        return FeedItem(
          feedAuthor: doc.data['company_name'] ?? '',
          feedContent: doc.data['content'] ?? '',
          feedDate: doc.data['date'].toDate().toString() ?? '',
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

  // Program collection reference  Mandus start
  final CollectionReference programCollection =
      Firestore.instance.collection('program');

  // program list from snapshot
  List<ProgramItem> _programListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.documents);
    return snapshot.documents.map(
      (doc) {
        return ProgramItem(
          startTime: doc.data['start_time'].toDate().toString() ?? '',
          stopTime: doc.data['stop_time'].toDate().toString() ?? '',
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
}
