part of 'salon_registration_repository.dart';

class _FirebaseSalonRegistrationDatabaseService
    implements _SalonRegistrationDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addNewSalonData(SalonRegistrationData data, String uid) async {
    await _db.collection('salons').doc(uid).set(data.toMap());
  }
}

abstract class _SalonRegistrationDatabaseService {
  Future<void> addNewSalonData(SalonRegistrationData data, String uid);
}
