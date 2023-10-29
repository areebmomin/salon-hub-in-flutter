part of 'salon_registration_repository.dart';

class _FirebaseSalonRegistrationStorageService
    implements _SalonRegistrationStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<void> uploadSalonProfilePicture(File imageFile, String uid) async {
    await _storage.child('salons').child(uid).child(uid).putFile(imageFile);
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
            .child('salons')
            .child(uid)
            .child('attendees')
            .child(index.toString())
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
            .child('salons')
            .child(uid)
            .child('owners')
            .child(index.toString())
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
