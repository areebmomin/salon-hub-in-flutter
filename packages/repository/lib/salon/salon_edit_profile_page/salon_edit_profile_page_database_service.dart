part of 'salon_edit_profile_page_repository.dart';

class _FirebaseSalonEditProfilePageDatabaseService
    implements _SalonEditProfilePageDatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> updateSalonData(EditProfilePageSalonInfo salonInfo) async {
    await _db
        .collection('salons')
        .doc(_auth.currentUser?.uid)
        .set(salonInfo.toMap());
  }
}

abstract class _SalonEditProfilePageDatabaseService {
  Future<void> updateSalonData(EditProfilePageSalonInfo salonInfo);
}
