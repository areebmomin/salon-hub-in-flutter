part of 'book_page_repository.dart';

class _FirebaseBookPageDatabaseService implements _BookPageDatabaseService {
  final _db = FirebaseFirestore.instance;
}

abstract class _BookPageDatabaseService {}
