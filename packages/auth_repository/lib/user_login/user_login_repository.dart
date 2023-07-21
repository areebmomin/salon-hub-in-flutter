import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';

part 'verify_phone_number_state.dart';

part 'user_login_auth_service.dart';

class FirebaseUserLoginRepository implements UserLoginRepository {
  StreamController<VerifyPhoneNumberState> loginState =
      StreamController<VerifyPhoneNumberState>();
  late final UserLoginAuthService _userLoginAuthService =
      FirebaseUserLoginAuthService();

  @override
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    loginState.add(VerifyPhoneNumberLoading());

    await _userLoginAuthService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        onVerificationCompleted: () {
          loginState.add(VerifyPhoneNumberCompleted());
        },
        onVerificationFailed: ({
          required String code,
          required String message,
        }) {
          VerifyPhoneNumberFailed(message: message, code: code);
        },
        onCodeSent: () {
          loginState.add(VerifyPhoneNumberCodeSent());
        },
        onTimeout: () {
          loginState.add(VerifyPhoneNumberTimeout());
        });
  }

  /// Call when user enter code manually
  @override
  Future<void> signInWithCredential({required String smsCode}) async {
    await _userLoginAuthService.signInWithCredential(
        smsCode: smsCode,
        onLoading: () {
          loginState.add(VerifyPhoneNumberLoading());
        },
        onVerificationCompleted: () {
          loginState.add(VerifyPhoneNumberCompleted());
        },
        onVerificationFailed: ({
          required String code,
          required String message,
        }) {
          VerifyPhoneNumberFailed(message: message, code: code);
        });
  }
}

abstract class UserLoginRepository {
  Future<void> verifyPhoneNumber({required String phoneNumber});

  Future<void> signInWithCredential({required String smsCode});
}
