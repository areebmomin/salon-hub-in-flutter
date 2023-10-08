import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUserProfileStorageService implements UserProfileStorageService {
  final _storage = FirebaseStorage.instance.ref();
  final _auth = FirebaseAuth.instance;

  @override
  Future<String> getUserProfilePictureUrl() {
    return _storage.child('users/${_auth.currentUser?.uid}').getDownloadURL();
  }
}

abstract class UserProfileStorageService {
  Future<String> getUserProfilePictureUrl();
}
