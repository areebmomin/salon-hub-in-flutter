part of 'request_tab_view_repository.dart';

class _FirebaseRequestTabStorageService
    implements _RequestTabStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getUserProfilePictureUrl(String userId) {
    return _storage.child('users').child(userId).getDownloadURL();
  }
}

abstract class _RequestTabStorageService {
  Future<String> getUserProfilePictureUrl(String userId);
}
