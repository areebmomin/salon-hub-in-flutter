part of 'schedule_tab_view_repository.dart';

class _FirebaseScheduleTabStorageService
    implements _ScheduleTabStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getUserProfilePictureUrl(String userId) {
    return _storage.child('users').child(userId).getDownloadURL();
  }
}

abstract class _ScheduleTabStorageService {
  Future<String> getUserProfilePictureUrl(String userId);
}
