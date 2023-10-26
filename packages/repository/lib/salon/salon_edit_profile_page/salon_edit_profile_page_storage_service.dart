part of 'salon_edit_profile_page_repository.dart';

class _FirebaseSalonEditProfilePageStorageService
    implements _SalonEditProfilePageStorageService {
  final _storage = FirebaseStorage.instance.ref();
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<void> uploadAttendeesProfilePicture(List<File?> list) async {
    for (var entry in list.asMap().entries) {
      var index = entry.key;
      var imageFile = entry.value;

      if (imageFile != null) {
        await _storage
            .child('salons')
            .child(uid!)
            .child('attendees')
            .child(index.toString())
            .putFile(imageFile);
      }
    }
  }

  @override
  Future<void> uploadOwnersProfilePicture(List<File?> list) async {
    for (var entry in list.asMap().entries) {
      var index = entry.key;
      var imageFile = entry.value;

      if (imageFile != null) {
        await _storage
            .child('salons')
            .child(uid!)
            .child('owners')
            .child(index.toString())
            .putFile(imageFile);
      }
    }
  }

  @override
  Future<void> uploadSalonProfilePicture(File imageFile) async {
    await _storage.child('salons').child(uid!).child(uid!).putFile(imageFile);
  }
}

abstract class _SalonEditProfilePageStorageService {
  Future<void> uploadSalonProfilePicture(File imageFile);

  Future<void> uploadOwnersProfilePicture(List<File?> list);

  Future<void> uploadAttendeesProfilePicture(List<File?> list);
}
