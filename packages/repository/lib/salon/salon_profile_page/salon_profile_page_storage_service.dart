part of 'salon_profile_page_repository.dart';

class _FirebaseSalonProfilePageStorageService
    implements _SalonProfilePageStorageService {
  final _storage = FirebaseStorage.instance.ref();
  final _uid = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Future<String> getSalonProfilePictureUrl() {
    return _storage.child('salons').child(_uid).child(_uid).getDownloadURL();
  }

  @override
  Future<String> getAttendeeProfilePictureUrl(int index) {
    return _storage
        .child('salons')
        .child(_uid)
        .child('attendees')
        .child(index.toString())
        .getDownloadURL();
  }

  @override
  Future<String> getOwnerProfilePictureUrl(int index) {
    return _storage
        .child('salons')
        .child(_uid)
        .child('owners')
        .child(index.toString())
        .getDownloadURL();
  }
}

abstract class _SalonProfilePageStorageService {
  Future<String> getSalonProfilePictureUrl();

  Future<String> getOwnerProfilePictureUrl(int index);

  Future<String> getAttendeeProfilePictureUrl(int index);
}
