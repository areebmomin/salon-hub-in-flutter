import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:repository/user/user_profile_page/models/booking_history.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import '../../utils/exceptions/database_exception.dart';

part 'user_profile_auth_service.dart';

part 'user_profile_database_service.dart';

part 'user_profile_storage_service.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  late final _UserProfileAuthService _authService =
      _FirebaseUserProfileAuthService();
  late final _UserProfileDatabaseService _databaseService =
      _FirebaseUserProfileDatabaseService();
  late final _UserProfileStorageService _storageService =
      _FirebaseUserProfileStorageService();

  @override
  Future<void> logout() {
    return _authService.logout();
  }

  @override
  Future<UserProfile> getUserProfile() {
    return _databaseService.fetchUserProfile();
  }

  @override
  Future<List<BookingHistory>> getUserBookingHistory() async {
    var bookingHistoryList = await _databaseService.getBookingHistoryList();

    final futures = <Future<String>>[];
    for (var salon in bookingHistoryList) {
      futures.add(getSalonProfilePictureUrl(salon.salonId));
    }
    final urls = await Future.wait(futures);
    bookingHistoryList.asMap().forEach((key, value) {
      value.salonProfilePictureUrl = urls[key];
    });

    return bookingHistoryList;
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
  Future<String> getSalonProfilePictureUrl(String salonId) async {
    try {
      return await _storageService.getSalonProfilePictureUrl(salonId);
    } catch (e) {
      return '';
    }
  }
}

abstract class UserProfileRepository {
  Future<void> logout();

  Future<UserProfile> getUserProfile();

  Future<String> getProfilePictureUrl();

  Future<String> getSalonProfilePictureUrl(String salonId);

  Future<List<BookingHistory>> getUserBookingHistory();
}
