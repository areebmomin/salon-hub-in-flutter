import 'package:firebase_storage/firebase_storage.dart';

part 'about_salon_page_storage_service.dart';

class FirebaseAboutSalonPageRepository implements AboutSalonPageRepository {
  late final _AboutSalonPageStorageService _storageService =
      _FirebaseAboutSalonPageStorageService();

  @override
  Future<String> fetchAttendeeProfileUrl(String salonId, int index) async {
    try {
      return await _storageService.getAttendeeProfilePictureUrl(salonId, index);
    } catch (e) {
      return '';
    }
  }

  @override
  Future<String> fetchOwnerProfileUrl(String salonId, int index) async {
    try {
      return await _storageService.getOwnerProfilePictureUrl(salonId, index);
    } catch (e) {
      return '';
    }
  }
}

abstract class AboutSalonPageRepository {
  Future<String> fetchOwnerProfileUrl(String salonId, int index);

  Future<String> fetchAttendeeProfileUrl(String salonId, int index);
}
