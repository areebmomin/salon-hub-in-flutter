import 'package:firebase_auth/firebase_auth.dart';

part 'signup_with_login_password_exception.dart';

part 'saloon_registration_auth_service.dart';

class FirebaseSaloonRegistrationRepository
    implements SaloonRegistrationRepository {
  late final SaloonRegistrationAuthService _saloonRegistrationAuthService =
      FirebaseSaloonRegistrationAuthService();

  @override
  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _saloonRegistrationAuthService.registerUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

abstract class SaloonRegistrationRepository {
  Future<void> registerUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
