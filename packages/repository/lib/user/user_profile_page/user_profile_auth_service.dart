part of 'user_profile_repository.dart';

class _FirebaseUserProfileAuthService implements _UserProfileAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> logout() {
    return _auth.signOut();
  }
}

abstract class _UserProfileAuthService {
  Future<void> logout();
}
