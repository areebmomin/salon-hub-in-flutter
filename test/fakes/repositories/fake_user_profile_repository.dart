import 'package:repository/user/user_profile_page/models/booking_history.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/user/user_profile_page/user_profile_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeUserProfileRepository implements UserProfileRepository {
  var returnSuccess = true;
  var list = [
    BookingHistory.getDefault(),
    BookingHistory.getDefault(),
    BookingHistory.getDefault(),
  ];

  @override
  Future<String> getProfilePictureUrl() async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }

  @override
  Future<String> getSalonProfilePictureUrl(String salonId) async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }

  @override
  Future<List<BookingHistory>> getUserBookingHistory() async {
    if (returnSuccess) {
      return list;
    } else {
      throw DatabaseException('Unable to load salon data');
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
  Future<void> logout() async {
    return;
  }
}
