part of 'user_profile_repository.dart';

class _FirebaseUserProfileStorageService implements _UserProfileStorageService {
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
  Future<String> getSalonProfilePictureUrl(String salonId) {
    return _storage
        .child('salons')
        .child(salonId)
        .child(salonId)
        .getDownloadURL();
  }
}

abstract class _UserProfileStorageService {
  Future<String> getUserProfilePictureUrl();

  Future<String> getSalonProfilePictureUrl(String salonId);
}
