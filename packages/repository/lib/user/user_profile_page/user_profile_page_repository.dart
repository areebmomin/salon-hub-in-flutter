import 'package:repository/user/user_profile_page/models/booking_history.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/user/user_profile_page/user_profile_auth_service.dart';
import 'package:repository/user/user_profile_page/user_profile_database_service.dart';
import 'package:repository/user/user_profile_page/user_profile_storage_service.dart';

class FirebaseUserProfilePageRepository implements UserProfilePageRepository {
  late final UserProfileAuthService _authService =
      FirebaseUserProfileAuthService();
  late final UserProfileDatabaseService _databaseService =
      FirebaseUserProfileDatabaseService();
  late final UserProfileStorageService _storageService =
      FirebaseUserProfileStorageService();

  @override
  Future<void> logout() {
    return _authService.logout();
  }

  @override
  Future<UserProfile> getUserProfile() {
    return _databaseService.fetchUserProfile();
  }

  @override
  Future<List<BookingHistory>> getUserBookingHistory() {
    return _databaseService.getBookingHistoryList();
  }

  @override
  Future<String> getProfilePictureUrl() {
    return _storageService.getUserProfilePictureUrl();
  }
}

abstract class UserProfilePageRepository {
  Future<void> logout();

  Future<UserProfile> getUserProfile();

  Future<String> getProfilePictureUrl();

  Future<List<BookingHistory>> getUserBookingHistory();
}
