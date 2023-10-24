part of 'salon_profile_page_repository.dart';

class _FirebaseSalonProfilePageAuthService
    implements _SalonProfilePageAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> logout() {
    return _auth.signOut();
  }
}

abstract class _SalonProfilePageAuthService {
  Future<void> logout();
}
