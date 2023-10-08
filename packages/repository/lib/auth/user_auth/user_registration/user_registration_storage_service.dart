part of 'user_registration_repository.dart';

class _FirebaseUserRegistrationStorageService
    implements _UserRegistrationStorageService {
  final _storage = FirebaseStorage.instance;

  @override
  Future<void> uploadUserProfilePicture(File imageFile, String uid) async {
    await _storage.ref().child('users/$uid').putFile(imageFile);
  }
}

abstract class _UserRegistrationStorageService {
  Future<void> uploadUserProfilePicture(File imageFile, String uid);
}
