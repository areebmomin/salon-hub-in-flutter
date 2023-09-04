import 'package:repository/user_registration/models/user_registration_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUserRegistrationDatabaseService
    implements UserRegistrationDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addNewUserData(UserRegistrationData data, String uid) async {
    await _db.collection("users").doc(uid).set(data.toMap());
  }
}

abstract class UserRegistrationDatabaseService {
  Future<void> addNewUserData(UserRegistrationData data, String uid);
}
