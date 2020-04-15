import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';

class DatabaseService {
  // companies collection reference
  final CollectionReference companiesCollection =
      Firestore.instance.collection('companies');

  // companies list from snapshot
  List<CompaniesItem> _companiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return CompaniesItem(
          companyName: doc.data['name'] ?? 'empty',
        );
      },
    ).toList();
  }

  // get companies stream
  Stream<List<CompaniesItem>> get companies {
    return companiesCollection.snapshots().map(_companiesListFromSnapshot);
  }

  // feed collection reference
  final CollectionReference feedCollection =
      Firestore.instance.collection('feed');

  // feed list from snapshot
  List<FeedItem> _feedListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return FeedItem(
          feedAuthor: doc.data['company_id'].toString() ?? 'empty',
          feedContent: doc.data['content'] ?? 'empty',
          feedDate: doc.data['date'].toDate().toString() ?? 'empty',
        );
      },
    ).toList();
  }

  // get feed stream
  Stream<List<FeedItem>> get feed {
    return feedCollection.snapshots().map(_feedListFromSnapshot);
  }
}
