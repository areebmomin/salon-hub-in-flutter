import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_database_service.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_repository_states.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_storage_service.dart';
import 'models/user_registration_data.dart';

class FirebaseUserRegistrationRepository implements UserRegistrationRepository {
  late final UserRegistrationDatabaseService _databaseService =
      FireStoreUserRegistrationDatabaseService();
  late final UserRegistrationStorageService _storageService =
      FirebaseUserRegistrationStorageService();

  @override
  Stream<UserRegistrationRepositoryState> addNewUserDataAndPhoto(
    UserRegistrationData data,
    String uid,
    File? imageFile,
  ) async* {
    try {
      await _databaseService.addNewUserData(data, uid);
      if (imageFile != null) {
        await _storageService.uploadUserProfilePicture(imageFile, uid);
      }
      yield UserRegistrationRepositorySuccess();
    } on FirebaseException catch (e) {
      yield UserRegistrationRepositoryFailure(e.message ?? 'Server error');
    }
  }
}

abstract class UserRegistrationRepository {
  Stream<UserRegistrationRepositoryState> addNewUserDataAndPhoto(
    UserRegistrationData data,
    String uid,
    File? imageFile,
  );
}
