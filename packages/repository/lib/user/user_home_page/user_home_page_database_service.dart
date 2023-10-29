part of 'user_home_page_repository.dart';

class _FirebaseUserHomePageDatabaseService
    implements _UserHomePageDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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

  @override
  Future<UserProfile> fetchUserProfile() {
    final docRef = _db.collection('users').doc(_auth.currentUser?.uid);
    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserProfile.fromDocumentSnapshot(data);
      },
      onError: (e) {
        debugPrint('Error getting document: $e');
        throw DatabaseException('Unable to load profile data');
      },
    );
  }
}

abstract class _UserHomePageDatabaseService {
  Future<List<UserHomePageSalonInfo>> fetchAllSalonInfo();

  Future<UserProfile> fetchUserProfile();
}
