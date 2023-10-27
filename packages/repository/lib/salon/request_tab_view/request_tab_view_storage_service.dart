part of 'request_tab_view_repository.dart';

class _FirebaseRequestTabViewStorageService
    implements _RequestTabViewStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getUserProfilePictureUrl(String salonId) {
    return _storage.child('users').child(salonId).getDownloadURL();
  }
}

abstract class _RequestTabViewStorageService {
  Future<String> getUserProfilePictureUrl(String salonId);
}
