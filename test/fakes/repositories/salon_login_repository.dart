import 'package:repository/auth/salon_auth/salon_login/salon_login_repository.dart';

class FakeSalonLoginRepository implements SalonLoginRepository {
  var returnSuccess = true;

  @override
  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    if(returnSuccess) {
      return;
    } else {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    if(returnSuccess) {
      return;
    } else {
      throw Exception('Passcode reset failed');
    }
  }
}
