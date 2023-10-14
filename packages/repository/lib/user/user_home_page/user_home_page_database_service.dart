part of 'user_home_page_repository.dart';

class _FirebaseUserHomePageDatabaseService
    implements _UserHomePageDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<List<UserHomePageSalonInfo>> fetchAllSalonInfo() {
    return _db.collection('salons').get().then(
      (querySnapshot) {
        List<UserHomePageSalonInfo> salonList = [];
        for (var docSnapshot in querySnapshot.docs) {
          salonList.add(UserHomePageSalonInfo.fromDocumentSnapshot(
            docSnapshot.id,
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

  @override
  Future<List<UserHomePageSalonInfo>> fetchFilteredSalonInfo() {
    // TODO: implement fetchFilteredSalonInfo
    throw UnimplementedError();
  }
}

abstract class _UserHomePageDatabaseService {
  Future<List<UserHomePageSalonInfo>> fetchAllSalonInfo();

  Future<List<UserHomePageSalonInfo>> fetchFilteredSalonInfo();
}
