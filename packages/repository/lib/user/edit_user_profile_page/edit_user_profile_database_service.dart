part of './edit_user_profile_repository.dart';

class _FirebaseEditUserProfileDatabaseService
    implements _EditUserProfileDatabaseService {
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
  Future<void> updateUserData(UserProfile data) async {
    await _db.collection('users').doc(_auth.currentUser?.uid).set(data.toMap());
  }
}

abstract class _EditUserProfileDatabaseService {
  Future<UserProfile> fetchUserProfile();

  Future<void> updateUserData(UserProfile data);
}
