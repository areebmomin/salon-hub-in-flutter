import 'package:repository/user/about_salon_page/about_salon_page_repository.dart';

class FakeAboutSalonPageRepository implements AboutSalonPageRepository {
  var returnSuccess = true;

  @override
  Future<String> fetchAttendeeProfileUrl(String salonId, int index) async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }

  @override
  Future<String> fetchOwnerProfileUrl(String salonId, int index) async {
    if (returnSuccess) {
      return 'fake_image_url';
    } else {
      return '';
    }
  }
}
