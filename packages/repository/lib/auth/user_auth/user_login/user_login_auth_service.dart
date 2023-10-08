part of 'user_login_repository.dart';

class _FirebaseUserLoginAuthService implements _UserLoginAuthService {
  final _auth = FirebaseAuth.instance;
  String? _verificationCode;

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    void Function(String uid)? onVerificationCompleted,
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
          await _auth.signInWithCredential(credential).then((auth) {
            var uid = auth.user?.uid;
            if (uid != null) onVerificationCompleted?.call(uid);
          });
        } catch (e) {
          onVerificationFailed?.call(message: 'Server error', code: '');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed?.call(
          message: e.message ?? 'Server error',
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
    void Function(String uid)? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
  }) async {
    if (_verificationCode == null) {
      onVerificationFailed?.call(message: 'Invalid code', code: '');
      return;
    }

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationCode ?? '', smsCode: smsCode);

    // Sign the user in (or link) with the credential
    try {
      await _auth.signInWithCredential(credential).then((auth) {
        var uid = auth.user?.uid;
        if (uid != null) onVerificationCompleted?.call(uid);
      });
    } catch (e) {
      onVerificationFailed?.call(message: 'Invalid code', code: '');
    }
  }
}

abstract class _UserLoginAuthService {
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    void Function(String uid)? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
    void Function()? onCodeSent,
    void Function()? onTimeout,
  });

  Future<void> signInWithCredential({
    required String smsCode,
    void Function(String uid)? onVerificationCompleted,
    void Function({required String code, required String message})?
        onVerificationFailed,
  });
}
