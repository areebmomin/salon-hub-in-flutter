import 'dart:async';
import 'package:repository/auth/user_auth/user_login/user_login_repository.dart';

class FakeUserLoginRepository implements UserLoginRepository {
  late final _loginState = StreamController<VerifyPhoneNumberState>();
  var returnSuccess = true;
  var verifyPhoneNumberState = VerifyPhoneNumberCompleted;

  @override
  void dispose() => _loginState.close();

  @override
  Future<void> signInWithCredential({required String smsCode}) async {
    if (returnSuccess) {
      _loginState.add(const VerifyPhoneNumberCompleted('uid'));
    } else {
      _loginState.add(const VerifyPhoneNumberFailed(
          message: 'Verification failed', code: '123'));
    }
  }

  @override
  Stream<VerifyPhoneNumberState> get status => _loginState.stream;

  @override
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    if (verifyPhoneNumberState == VerifyPhoneNumberCompleted) {
      _loginState.add(const VerifyPhoneNumberCompleted('uid'));
    } else if (verifyPhoneNumberState == VerifyPhoneNumberFailed) {
      _loginState.add(const VerifyPhoneNumberFailed(
        message: 'Verification failed',
        code: '123',
      ));
    } else if (verifyPhoneNumberState == VerifyPhoneNumberCodeSent) {
      _loginState.add(VerifyPhoneNumberCodeSent());
    } else if (verifyPhoneNumberState == VerifyPhoneNumberTimeout) {
      _loginState.add(VerifyPhoneNumberTimeout());
    }
  }
}
