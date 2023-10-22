part of 'user_home_page_repository.dart';

class _FirebaseUserHomePageStorageService
    implements _UserHomePageStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getSalonOwnerProfilePictureUrl(String salonId) {
    return _storage
        .child('salons')
        .child(salonId)
        .child(salonId)
        .getDownloadURL();
  }

  @override
  Future<String> getSalonProfilePictureUrl(String salonId) {
    return _storage
        .child('salons')
        .child(salonId)
        .child('owners')
        .child('0')
        .getDownloadURL();
  }
}

abstract class _UserHomePageStorageService {
  Future<String> getSalonProfilePictureUrl(String salonId);

  Future<String> getSalonOwnerProfilePictureUrl(String salonId);
}
