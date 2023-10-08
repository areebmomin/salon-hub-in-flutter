part of 'user_profile_repository.dart';

class _FirebaseUserProfileDatabaseService implements _UserProfileDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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

  @override
  Future<List<BookingHistory>> getBookingHistoryList() {
    // TODO: implement getBookingHistoryList
    throw UnimplementedError();
  }
}

abstract class _UserProfileDatabaseService {
  Future<UserProfile> fetchUserProfile();

  Future<List<BookingHistory>> getBookingHistoryList();
}
