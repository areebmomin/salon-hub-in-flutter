import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/exceptions/database_exception.dart';
import 'models/salon_profile_info.dart';

part 'salon_profile_page_database_service.dart';

part 'salon_profile_page_storage_service.dart';

part 'salon_profile_page_auth_service.dart';

class FirebaseSalonProfilePageRepository implements SalonProfilePageRepository {
  late final _SalonProfilePageAuthService _authService =
      _FirebaseSalonProfilePageAuthService();
  late final _SalonProfilePageDatabaseService _databaseService =
      _FirebaseSalonProfilePageDatabaseService();
  late final _SalonProfilePageStorageService _storageService =
      _FirebaseSalonProfilePageStorageService();

  @override
  Future<SalonProfileInfo> getSalonProfile() async {
    var salonProfileInfo = await _databaseService.fetchSalonInfo();
    salonProfileInfo.salonProfilePictureUrl =
        await _getSalonProfilePictureUrl();
    return salonProfileInfo;
  }

  Future<String> _getSalonProfilePictureUrl() async {
    try {
      return await _storageService.getSalonProfilePictureUrl();
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> fetchAttendeeProfileUrl(int index) async {
    try {
      return await _storageService.getAttendeeProfilePictureUrl(index);
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> fetchOwnerProfileUrl(int index) async {
    try {
      return await _storageService.getOwnerProfilePictureUrl(index);
    } catch (e) {
      return '';
    }
  }

  @override
  Future<void> logout() {
    return _authService.logout();
  }
}

abstract class SalonProfilePageRepository {
  Future<SalonProfileInfo> getSalonProfile();

  Future<void> logout();

  Future<String> fetchOwnerProfileUrl(int index);

  Future<String> fetchAttendeeProfileUrl(int index);
}
