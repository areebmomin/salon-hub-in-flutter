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
}

abstract class UserProfilePageRepository {
  Future<void> logout();
}
