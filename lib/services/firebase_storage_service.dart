import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thyevent/companies/models/companies_item.dart';
import 'package:thyevent/feed/models/feed_item.dart';

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
}
