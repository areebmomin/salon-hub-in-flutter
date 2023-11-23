import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeUserHomePageRepository implements UserHomePageRepository {
  var returnSuccess = true;
  var list = [
    UserHomePageSalonInfo(
      '1',
      'Beauty Salon',
      'Mumbai',
      '+91 81346768645',
      'Male',
      [true, true, false, true, true, true, true],
      ServiceTime(),
      [],
      AvailabilityStatus.open,
      'salonProfilePictureUrl',
      'ownerProfilePictureUrl',
      [],
      [],
    ),
    UserHomePageSalonInfo(
      '2',
      'Beardo Salon',
      'Delhi',
      '+91 81346778645',
      'Female',
      [false, true, true, false, true, true, true],
      ServiceTime(),
      [],
      AvailabilityStatus.close,
      'salonProfilePictureUrl',
      'ownerProfilePictureUrl',
      [],
      [],
    ),
    UserHomePageSalonInfo(
      '3',
      'Scissors Salon',
      'Bangalore',
      '+91 81346772341',
      'Male/Female',
      [false, true, true, false, true, false, true],
      ServiceTime(),
      [],
      AvailabilityStatus.close,
      'salonProfilePictureUrl',
      'ownerProfilePictureUrl',
      [],
      [],
    ),
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
