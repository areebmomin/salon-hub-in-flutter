part of 'salon_login_repository.dart';

class FirebaseSalonLoginAuthService implements SalonLoginAuthService {
  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
}

abstract class SalonLoginAuthService {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> logOut();
}
