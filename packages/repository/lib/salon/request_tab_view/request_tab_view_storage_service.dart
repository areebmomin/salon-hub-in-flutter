part of 'request_tab_view_repository.dart';

class _FirebaseRequestTabViewStorageService
    implements _RequestTabViewStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getUserProfilePictureUrl(String userId) {
    return _storage.child('users').child(userId).getDownloadURL();
  }
}

abstract class _RequestTabViewStorageService {
  Future<String> getUserProfilePictureUrl(String userId);
}
