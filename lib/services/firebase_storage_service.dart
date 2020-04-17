import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/program/models/program_item.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  // companies and feed join collection

  // companies collection reference
  final CollectionReference companiesCollection =
      Firestore.instance.collection('companies');

  // feed collection query
  final Query feedCollection =
      Firestore.instance.collection('feed').orderBy('date', descending: true);

  // Program collection reference, finds the collection in firebase database.
  final Query programCollection =
      Firestore.instance.collection('program').orderBy('start_time');

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
}
