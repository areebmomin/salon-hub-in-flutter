part of './edit_user_profile_repository.dart';

class _FirebaseEditUserProfileStorageService
    implements _EditUserProfileStorageService {
  final _storage = FirebaseStorage.instance.ref();
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> getUserProfilePictureUrl() {
    return _storage.child('users/${_auth.currentUser?.uid}').getDownloadURL();
  }
}

abstract class _EditUserProfileStorageService {
  Future<String> getUserProfilePictureUrl();
}
