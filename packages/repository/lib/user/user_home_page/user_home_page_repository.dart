import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import '../../utils/exceptions/database_exception.dart';
import '../user_profile_page/models/user_profile.dart';
import 'models/user_home_page_salon_info.dart';

part 'user_home_page_database_service.dart';

part 'user_home_page_storage_service.dart';

class FirebaseUserHomePageRepository implements UserHomePageRepository {
  late final _UserHomePageDatabaseService _databaseService =
      _FirebaseUserHomePageDatabaseService();
  late final _UserHomePageStorageService _storageService =
      _FirebaseUserHomePageStorageService();

  @override
  Future<List<UserHomePageSalonInfo>> getAllSalonInfo() async {
    var salonList = await _databaseService.fetchAllSalonInfo();

    for (var salon in salonList) {
      final profilePictureUrls = await Future.wait([
        _getSalonProfilePictureUrl(salon.salonId),
        _getSalonOwnerProfilePictureUrl(salon.salonId),
      ]);

      salon.salonProfilePictureUrl = profilePictureUrls[0];
      salon.ownerProfilePictureUrl = profilePictureUrls[1];
    }

    return salonList;
  }

  @override
  Future<UserProfile> getUserProfile() {
    return _databaseService.fetchUserProfile();
  }

  Future<String> _getSalonProfilePictureUrl(String salonId) async {
    try {
      return await _storageService.getSalonProfilePictureUrl(salonId);
    } catch (e) {
      return '';
    }
  }

  Future<String> _getSalonOwnerProfilePictureUrl(String salonId) async {
    try {
      return await _storageService.getSalonOwnerProfilePictureUrl(salonId);
    } catch (e) {
      return '';
    }
  }
}

abstract class UserHomePageRepository {
  Future<List<UserHomePageSalonInfo>> getAllSalonInfo();
  Future<UserProfile> getUserProfile();
}
