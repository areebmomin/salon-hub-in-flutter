import 'package:firebase_auth/firebase_auth.dart';

import 'login_with_email_password_exceptions.dart';

class SaloonLoginRepository {
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
