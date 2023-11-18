import 'dart:io';
import 'package:repository/user/edit_user_profile_page/edit_user_profile_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeEditUserProfilePageRepository implements EditUserProfileRepository {
  var returnSuccess = true;

  @override
  Future<String> getProfilePictureUrl() async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
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

  @override
  Future<bool> updateUserDataAndPhoto(UserProfile data, File? imageFile) async {
    return returnSuccess;
  }
}
