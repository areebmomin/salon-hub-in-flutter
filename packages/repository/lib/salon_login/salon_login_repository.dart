import 'package:firebase_auth/firebase_auth.dart';

part 'login_with_email_password_exceptions.dart';

part 'salon_login_auth_service.dart';

class FirebaseSalonLoginRepository implements SalonLoginRepository {
  late final SalonLoginAuthService salonLoginAuthService =
      FirebaseSalonLoginAuthService();

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await salonLoginAuthService.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    await salonLoginAuthService.logOut();
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await salonLoginAuthService.sendPasswordResetEmail(email: email);
  }
}

abstract class SalonLoginRepository {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> logOut();
}
