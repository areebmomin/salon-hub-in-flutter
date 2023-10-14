import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import '../../utils/exceptions/database_exception.dart';
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
    DateTime now = DateTime.now();
    var salonList = await _databaseService.fetchAllSalonInfo();

    for (var salon in salonList) {
      final isServiceDay = salon.serviceDays[now.weekday % 7];
      salon.availabilityStatus = isServiceDay
          ? salon.serviceTime.getAvailabilityStatus(now)
          : AvailabilityStatus.close;
    }

    return salonList;
  }

  @override
  Future<List<UserHomePageSalonInfo>> getFilteredSalonInfo() {
    // TODO: implement getFilteredSalonInfo
    throw UnimplementedError();
  }

  @override
  Future<String> getSalonOwnerProfilePictureUrl(String salonId) async {
    try {
      return await _storageService.getSalonOwnerProfilePictureUrl();
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> getSalonProfilePictureUrl(String salonId) async {
    try {
      return await _storageService.getSalonProfilePictureUrl();
    } catch (e) {
      return '';
    }
  }
}

abstract class UserHomePageRepository {
  Future<List<UserHomePageSalonInfo>> getAllSalonInfo();

  Future<List<UserHomePageSalonInfo>> getFilteredSalonInfo();

  Future<String> getSalonProfilePictureUrl(String salonId);

  Future<String> getSalonOwnerProfilePictureUrl(String salonId);
}
