part of 'about_salon_page_repository.dart';

class _FirebaseAboutSalonPageStorageService
    implements _AboutSalonPageStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getAttendeeProfilePictureUrl(String salonId, int index) {
    return _storage
        .child('salons')
        .child(salonId)
        .child('attendees')
        .child(index.toString())
        .getDownloadURL();
  }

  @override
  Future<String> getOwnerProfilePictureUrl(String salonId, int index) {
    return _storage
        .child('salons')
        .child(salonId)
        .child('owners')
        .child(index.toString())
        .getDownloadURL();
  }
}

abstract class _AboutSalonPageStorageService {
  Future<String> getOwnerProfilePictureUrl(String salonId, int index);

  Future<String> getAttendeeProfilePictureUrl(String salonId, int index);
}
