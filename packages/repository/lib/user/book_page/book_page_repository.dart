import 'package:cloud_firestore/cloud_firestore.dart';

part 'book_page_database_service.dart';

class FirebaseBookPageRepository implements BookPageRepository {
  late final _BookPageDatabaseService _databaseService =
      _FirebaseBookPageDatabaseService();
}

abstract class BookPageRepository {}
