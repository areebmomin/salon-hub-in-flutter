import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseSalonRegistrationStorageService
    implements SalonRegistrationStorageService {
  final _storage = FirebaseStorage.instance;

  @override
  Future<void> uploadSalonProfilePicture(File imageFile, String uid) async {
    var extension = imageFile.path.split('.').last;
    await _storage
        .ref()
        .child('salons/$uid/$uid.$extension')
        .putFile(imageFile);
  }

  @override
  Future<void> uploadAttendeesProfilePicture(
    List<File?> list,
    String uid,
  ) async {
    for (var entry in list.asMap().entries) {
      var index = entry.key;
      var imageFile = entry.value;

      if (imageFile != null) {
        var extension = imageFile.path.split('.').last;
        await _storage
            .ref()
            .child('salons/$uid/attendees/$index.$extension')
            .putFile(imageFile);
      }
    }
  }

  @override
  Future<void> uploadOwnersProfilePicture(List<File?> list, String uid) async {
    for (var entry in list.asMap().entries) {
      var index = entry.key;
      var imageFile = entry.value;

      if (imageFile != null) {
        var extension = imageFile.path.split('.').last;
        await _storage
            .ref()
            .child('salons/$uid/owners/$index.$extension')
            .putFile(imageFile);
      }
    }
  }
}

abstract class SalonRegistrationStorageService {
  Future<void> uploadSalonProfilePicture(File imageFile, String uid);

  Future<void> uploadOwnersProfilePicture(
    List<File?> list,
    String uid,
  );

  Future<void> uploadAttendeesProfilePicture(
    List<File?> list,
    String uid,
  );
}
