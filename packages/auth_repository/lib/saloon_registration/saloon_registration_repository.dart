import 'package:auth_repository/saloon_registration/signup_with_login_password_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaloonRegistrationRepository {
  Future<void> registerUserWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }
}
