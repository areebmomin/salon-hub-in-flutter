part of 'schedule_tab_view_repository.dart';

class _FirebaseScheduleTabViewStorageService
    implements _ScheduleTabViewStorageService {
  final _storage = FirebaseStorage.instance.ref();

  @override
  Future<String> getUserProfilePictureUrl(String userId) {
    return _storage.child('users').child(userId).getDownloadURL();
  }
}

abstract class _ScheduleTabViewStorageService {
  Future<String> getUserProfilePictureUrl(String userId);
}
