import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';

part 'verify_phone_number_state.dart';

part 'user_login_auth_service.dart';

class FirebaseUserLoginRepository implements UserLoginRepository {
  late final _loginState = StreamController<VerifyPhoneNumberState>();
  late final UserLoginAuthService _userLoginAuthService =
      FirebaseUserLoginAuthService();

  @override
  get status => _loginState.stream;

  @override
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    await _userLoginAuthService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        onVerificationCompleted: () {
          _loginState.add(VerifyPhoneNumberCompleted());
        },
        onVerificationFailed: ({
          required String code,
          required String message,
        }) {
          VerifyPhoneNumberFailed(message: message, code: code);
        },
        onCodeSent: () {
          _loginState.add(VerifyPhoneNumberCodeSent());
        },
        onTimeout: () {
          _loginState.add(VerifyPhoneNumberTimeout());
        });
  }

  /// Call when user enter code manually
  @override
  Future<void> signInWithCredential({required String smsCode}) async {
    await _userLoginAuthService.signInWithCredential(
        smsCode: smsCode,
        onVerificationCompleted: () {
          _loginState.add(VerifyPhoneNumberCompleted());
        },
        onVerificationFailed: ({
          required String code,
          required String message,
        }) {
          VerifyPhoneNumberFailed(message: message, code: code);
        });
  }

  @override
  void dispose() => _loginState.close();
}

abstract class UserLoginRepository {
  Stream<VerifyPhoneNumberState> get status;

  Future<void> verifyPhoneNumber({required String phoneNumber});

  Future<void> signInWithCredential({required String smsCode});

  void dispose();
}
