part of 'user_home_page_repository.dart';

class _FirebaseUserHomePageDatabaseService
    implements _UserHomePageDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<List<UserHomePageSalonInfo>> fetchAllSalonInfo() {
    DateTime now = DateTime.now();
    return _db.collection('salons').get().then(
      (querySnapshot) {
        List<UserHomePageSalonInfo> salonList = [];
        for (var docSnapshot in querySnapshot.docs) {
          salonList.add(UserHomePageSalonInfo.fromDocumentSnapshot(
            docSnapshot.id,
            now,
            docSnapshot.data(),
          ));
        }
        return salonList;
      },
      onError: (e) {
        debugPrint('Error getting collection: $e');
        throw DatabaseException('Unable to load salon data');
      },
    );
  }
}

abstract class _UserHomePageDatabaseService {
  Future<List<UserHomePageSalonInfo>> fetchAllSalonInfo();
}
