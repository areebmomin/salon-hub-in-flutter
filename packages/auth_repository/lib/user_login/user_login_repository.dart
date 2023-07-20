import 'dart:async';

import 'package:auth_repository/user_login/verify_phone_number_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLoginRepository {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamController<VerifyPhoneNumberState> loginState =
      StreamController<VerifyPhoneNumberState>();
  String? _verificationCode;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    loginState.add(VerifyPhoneNumberLoading());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        try {
          await _auth.signInWithCredential(credential);
          loginState.add(VerifyPhoneNumberCompleted());
        } catch (e) {
          loginState.add(
              const VerifyPhoneNumberFailed(message: 'Server error', code: ''));
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        loginState.add(VerifyPhoneNumberFailed(
            message: e.message ?? "Server error", code: e.code));
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationCode = verificationId;
        loginState.add(VerifyPhoneNumberCodeSent());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        loginState.add(VerifyPhoneNumberTimeout());
      },
    );
  }

  /// Call when user enter code manually
  Future<void> signInWithCredential(String smsCode) async {
    if (_verificationCode == null) {
      loginState.add(
          const VerifyPhoneNumberFailed(message: 'Invalid code', code: ''));
      return;
    }

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode ?? '', smsCode: smsCode);

    // Sign the user in (or link) with the credential
    try {
      await _auth.signInWithCredential(credential);
      loginState.add(VerifyPhoneNumberCompleted());
    } catch (e) {
      loginState.add(
          const VerifyPhoneNumberFailed(message: 'Invalid code', code: ''));
    }
  }
}
