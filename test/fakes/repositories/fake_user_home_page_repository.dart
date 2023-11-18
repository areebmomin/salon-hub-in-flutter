import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeUserHomePageRepository implements UserHomePageRepository {
  var returnSuccess = true;
  var list = [
    UserHomePageSalonInfo.getDefault(),
    UserHomePageSalonInfo.getDefault(),
    UserHomePageSalonInfo.getDefault(),
  ];

  @override
  Future<List<UserHomePageSalonInfo>> getAllSalonInfo() async {
    if (returnSuccess) {
      return list;
    } else {
      throw DatabaseException('Unable to load profile data');
    }
  }

  @override
  Future<UserProfile> getUserProfile() async {
    if (returnSuccess) {
      return UserProfile(
        'Areeb',
        '+91 8127422387',
        'aribtest@gmail.com',
        'Mumbai',
      );
    } else {
      throw DatabaseException('Unable to load profile data');
    }
  }
}
