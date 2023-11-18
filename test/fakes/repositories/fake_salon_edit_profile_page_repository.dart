import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:repository/salon/salon_edit_profile_page/salon_edit_profile_page_repository.dart';

class FakeSalonEditProfilePageRepository
    implements SalonEditProfilePageRepository {
  @override
  Future<void> updateSalonData(EditProfilePageSalonInfo salonInfo) async {
    return;
  }
}
