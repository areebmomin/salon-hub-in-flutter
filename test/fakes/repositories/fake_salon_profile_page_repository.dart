import 'package:repository/salon/salon_profile_page/models/salon_profile_info.dart';
import 'package:repository/salon/salon_profile_page/salon_profile_page_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeSalonProfilePageRepository implements SalonProfilePageRepository {
  var returnSuccess = true;

  @override
  Future<String> fetchAttendeeProfileUrl(int index) async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }

  @override
  Future<String> fetchOwnerProfileUrl(int index) async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }

  @override
  Future<SalonProfileInfo> getSalonProfile() async {
    if (returnSuccess) {
      return SalonProfileInfo.getDefault();
    } else {
      throw DatabaseException('Unable to load profile data');
    }
  }

  @override
  Future<void> logout() async {
    return;
  }
}
