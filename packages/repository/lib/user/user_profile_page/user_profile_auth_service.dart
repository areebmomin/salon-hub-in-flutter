import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserProfileAuthService implements UserProfileAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> logout() {
    return _auth.signOut();
  }
}

abstract class UserProfileAuthService {
  Future<void> logout();
}
