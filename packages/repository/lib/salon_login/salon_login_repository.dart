import 'package:firebase_auth/firebase_auth.dart';

part 'login_with_email_password_exceptions.dart';

part 'salon_login_auth_service.dart';

class FirebaseSaloonLoginRepository implements SaloonLoginRepository {
  late final SaloonLoginAuthService saloonLoginAuthService =
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

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await saloonLoginAuthService.sendPasswordResetEmail(email: email);
  }
}

abstract class SaloonLoginRepository {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> logOut();
}
