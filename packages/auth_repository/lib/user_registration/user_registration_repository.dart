import 'package:auth_repository/user_registration/models/user_registration_data.dart';
import 'package:auth_repository/user_registration/user_registration_database_service.dart';
import 'package:auth_repository/user_registration/user_registration_repository_states.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUserRegistrationRepository implements UserRegistrationRepository {
  late final UserRegistrationDatabaseService _databaseService =
      FireStoreUserRegistrationDatabaseService();

  @override
  Stream<UserRegistrationRepositoryState> addNewUserDataAndPhoto(
      UserRegistrationData data, String uid) async* {
    try {
      await _databaseService.addNewUserData(data, uid);

      yield UserRegistrationRepositorySuccess();
    } on FirebaseException catch (e) {
      yield UserRegistrationRepositoryFailure(e.message ?? "Server error");
    }
  }
}

abstract class UserRegistrationRepository {
  Stream<UserRegistrationRepositoryState> addNewUserDataAndPhoto(
      UserRegistrationData data, String uid);
}
