import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUserRegistrationStorageService
    implements UserRegistrationStorageService {
  final _storage = FirebaseStorage.instance;

  @override
  Future<void> uploadUserProfilePicture(File imageFile, String uid) async {
    var extension = imageFile.path.split('.').last;
    await _storage.ref().child('users/$uid.$extension').putFile(imageFile);
  }
}

abstract class UserRegistrationStorageService {
  Future<void> uploadUserProfilePicture(File imageFile, String uid);
}
