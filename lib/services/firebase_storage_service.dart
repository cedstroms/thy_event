import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';
import 'package:thyevent/feed/widgets/setting_general/general_item.dart';
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

  // Setting collection reference
  final CollectionReference settingCollection =
      Firestore.instance.collection('setting');

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
            companyId: doc.data['id'] ?? 0,
            contactInfo: doc.data['contact_info'] ?? '');
      },
    ).toList();
  }

  // feed list from snapshot
  List<FeedItem> _feedListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return FeedItem(
          authorID: doc.data['company_id'] ?? '',
          logo: doc.data['logo'] ?? '',
          author: doc.data['company_name'] ?? '',
          content: doc.data['content'] ?? '',
          date: DateFormat.Hm()
                  .add_MMMMEEEEd()
                  .format(doc.data['date'].toDate()) ??
              '',
        );
      },
    ).toList();
  }

  // program list from snapshot
  List<ProgramItem> _programListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        // returns the data that is in the collection.
        return ProgramItem(
          startTime:
              DateFormat.Hm().format(doc.data['start_time'].toDate()) ?? '',
          endTime: DateFormat.Hm().format(doc.data['end_time'].toDate()) ?? '',
          title: doc.data['title'] ?? '',
          subTitle: doc.data['sub_title'] ?? '',
          tabNumber: doc.data['tab_number'] ?? 0,
        );
      },
    ).toList();
  }

  // Setting list from snapshot
  List<SettingsDatabaseItem> _settingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        // returns the data that is in the collection.
        return SettingsDatabaseItem(
          title: doc.data['title'] ?? '',
          information: doc.data['information'] ?? '',
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

  // get program stream
  Stream<List<ProgramItem>> get program {
    return programCollection.snapshots().map(_programListFromSnapshot);
  }

  // get setting stream
  Stream<List<SettingsDatabaseItem>> get setting {
    return settingCollection.snapshots().map(_settingListFromSnapshot);
  }
}
