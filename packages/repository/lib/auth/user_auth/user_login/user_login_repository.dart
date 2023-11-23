import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';

part 'verify_phone_number_state.dart';

part 'user_login_auth_service.dart';

class FirebaseUserLoginRepository implements UserLoginRepository {
  late final _loginState = StreamController<VerifyPhoneNumberState>();
  late final _UserLoginAuthService _authService =
      _FirebaseUserLoginAuthService();

  @override
  get status => _loginState.stream;

  @override
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    await _authService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onVerificationCompleted: (uid) {
        _loginState.add(VerifyPhoneNumberCompleted(uid));
      },
      onVerificationFailed: ({
        required String code,
        required String message,
      }) {
        _loginState.add(VerifyPhoneNumberFailed(message: message, code: code));
      },
      onCodeSent: () {
        _loginState.add(VerifyPhoneNumberCodeSent());
      },
      onTimeout: () {
        _loginState.add(VerifyPhoneNumberTimeout());
      },
    );
  }

  /// Call when user enter code manually
  @override
  Future<void> signInWithCredential({required String smsCode}) async {
    await _authService.signInWithCredential(
        smsCode: smsCode,
        onVerificationCompleted: (uid) {
          _loginState.add(VerifyPhoneNumberCompleted(uid));
        },
        onVerificationFailed: ({
          required String code,
          required String message,
        }) {
          _loginState
              .add(VerifyPhoneNumberFailed(message: message, code: code));
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
