part of 'salon_profile_page_repository.dart';

class _FirebaseSalonProfilePageDatabaseService
    implements _SalonProfilePageDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _uid = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Future<SalonProfileInfo> fetchSalonInfo() {
    final docRef = _db.collection('salons').doc(_uid);
    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return SalonProfileInfo.fromDocumentSnapshot(data);
      },
      onError: (e) {
        debugPrint('Error getting document: $e');
        throw DatabaseException('Unable to load profile data');
      },
    );
  }
}

abstract class _SalonProfilePageDatabaseService {
  Future<SalonProfileInfo> fetchSalonInfo();
}
