import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_repository_states.dart';
import 'models/user_registration_data.dart';

part 'user_registration_database_service.dart';

part 'user_registration_storage_service.dart';

class FirebaseUserRegistrationRepository implements UserRegistrationRepository {
  late final _UserRegistrationDatabaseService _databaseService =
      _FireStoreUserRegistrationDatabaseService();
  late final _UserRegistrationStorageService _storageService =
      _FirebaseUserRegistrationStorageService();

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
