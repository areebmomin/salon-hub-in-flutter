part of './edit_user_profile_repository.dart';

class _FirebaseEditUserProfileStorageService
    implements _EditUserProfileStorageService {
  final _storage = FirebaseStorage.instance.ref();
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> getUserProfilePictureUrl() {
    return _storage
        .child('users')
        .child(_auth.currentUser?.uid ?? '')
        .getDownloadURL();
  }

  @override
  Future<void> uploadUserProfilePicture(File imageFile) async {
    await _storage
        .child('users')
        .child(_auth.currentUser?.uid ?? '')
        .putFile(imageFile);
  }
}

abstract class _EditUserProfileStorageService {
  Future<String> getUserProfilePictureUrl();

  Future<void> uploadUserProfilePicture(File imageFile);
}
