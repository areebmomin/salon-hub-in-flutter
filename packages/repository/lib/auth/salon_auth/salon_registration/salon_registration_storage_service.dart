part of 'salon_registration_repository.dart';

class _FirebaseSalonRegistrationStorageService
    implements _SalonRegistrationStorageService {
  final _storage = FirebaseStorage.instance;

  @override
  Future<void> uploadSalonProfilePicture(File imageFile, String uid) async {
    await _storage
        .ref()
        .child('salons/$uid/$uid')
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
        await _storage
            .ref()
            .child('salons/$uid/attendees/$index')
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
        await _storage
            .ref()
            .child('salons/$uid/owners/$index')
            .putFile(imageFile);
      }
    }
  }
}

abstract class _SalonRegistrationStorageService {
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
