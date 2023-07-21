import 'package:firebase_auth/firebase_auth.dart';

part 'login_with_email_password_exceptions.dart';

part 'saloon_login_auth_service.dart';

class FirebaseSaloonLoginRepository implements SaloonLoginRepository {
  SaloonLoginAuthService saloonLoginAuthService =
      FirebaseSaloonLoginAuthService();

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await saloonLoginAuthService.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    await saloonLoginAuthService.logOut();
  }
}

abstract class SaloonLoginRepository {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
