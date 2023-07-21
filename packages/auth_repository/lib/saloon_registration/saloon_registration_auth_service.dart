part of 'saloon_registration_repository.dart';

class FirebaseSaloonRegistrationAuthService
    implements SaloonRegistrationAuthService {
  @override
  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
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

abstract class SaloonRegistrationAuthService {
  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
