part of 'user_login_repository.dart';

class FirebaseUserLoginAuthService implements UserLoginAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationCode;

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    void Function()? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
    void Function()? onCodeSent,
    void Function()? onTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        try {
          await _auth.signInWithCredential(credential);
          onVerificationCompleted?.call();
        } catch (e) {
          onVerificationFailed?.call(message: 'Server error', code: '');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed?.call(
          message: e.message ?? "Server error",
          code: e.code,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationCode = verificationId;
        onCodeSent?.call();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        onTimeout?.call();
      },
    );
  }

  @override
  Future<void> signInWithCredential({
    required String smsCode,
    void Function()? onLoading,
    void Function()? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
  }) async {
    if (_verificationCode == null) {
      onVerificationFailed?.call(message: 'Invalid code', code: '');
      return;
    }

    onLoading?.call();

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode ?? '', smsCode: smsCode);

    // Sign the user in (or link) with the credential
    try {
      await _auth.signInWithCredential(credential);
      onVerificationCompleted?.call();
    } catch (e) {
      onVerificationFailed?.call(message: 'Invalid code', code: '');
    }
  }
}

abstract class UserLoginAuthService {
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    void Function()? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
    void Function()? onCodeSent,
    void Function()? onTimeout,
  });

  Future<void> signInWithCredential({
    required String smsCode,
    void Function()? onLoading,
    void Function()? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
  });
}
