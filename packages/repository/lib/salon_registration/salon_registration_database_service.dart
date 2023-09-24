import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/salon_registration_data.dart';

class FirebaseSalonRegistrationDatabaseService implements
    SalonRegistrationDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addNewSalonData(SalonRegistrationData data, String uid) async {
    await _db.collection("salons").doc(uid).set(data.toMap());
  }
}

abstract class SalonRegistrationDatabaseService {
  Future<void> addNewSalonData(SalonRegistrationData data, String uid);
}
