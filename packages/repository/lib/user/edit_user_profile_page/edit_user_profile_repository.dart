import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../user_profile_page/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../../utils/exceptions/database_exception.dart';

part 'edit_user_profile_storage_service.dart';

part 'edit_user_profile_database_service.dart';

class FirebaseEditUserProfileRepository implements EditUserProfileRepository {
  late final _EditUserProfileDatabaseService _databaseService =
      _FirebaseEditUserProfileDatabaseService();
  late final _EditUserProfileStorageService _storageService =
      _FirebaseEditUserProfileStorageService();

  @override
  Future<UserProfile> getUserProfile() {
    return _databaseService.fetchUserProfile();
  }

  @override
  Future<String> getProfilePictureUrl() async {
    try {
      return await _storageService.getUserProfilePictureUrl();
    } catch (e) {
      return '';
    }
  }

  @override
  Future<bool> updateUserDataAndPhoto(UserProfile data, File? imageFile) async {
    try {
      await _databaseService.updateUserData(data);
      if (imageFile != null) {
        await _storageService.uploadUserProfilePicture(imageFile);
      }
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }
}

abstract class EditUserProfileRepository {
  Future<UserProfile> getUserProfile();

  Future<String> getProfilePictureUrl();

  Future<bool> updateUserDataAndPhoto(UserProfile data, File? imageFile);
}
