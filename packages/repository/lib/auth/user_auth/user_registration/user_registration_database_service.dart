part of 'user_registration_repository.dart';

class _FireStoreUserRegistrationDatabaseService
    implements _UserRegistrationDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addNewUserData(UserRegistrationData data, String uid) async {
    await _db.collection('users').doc(uid).set(data.toMap());
  }
}

abstract class _UserRegistrationDatabaseService {
  Future<void> addNewUserData(UserRegistrationData data, String uid);
}
