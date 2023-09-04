import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/saloon_registration_data.dart';

class FirebaseSaloonRegistrationDatabaseService implements
    SaloonRegistrationDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addNewSaloonData(SaloonRegistrationData data, String uid) async {
    await _db.collection("saloons").doc(uid).set(data.toMap());
  }
}

abstract class SaloonRegistrationDatabaseService {
  Future<void> addNewSaloonData(SaloonRegistrationData data, String uid);
}
