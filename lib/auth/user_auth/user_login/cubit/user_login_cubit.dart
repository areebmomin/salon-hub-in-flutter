import 'package:auth_repository/user_login/user_login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit(this._userLoginRepository) : super(UserLoginInitial()) {
    _userLoginRepository.status.listen(loginStatusListener);
  }

  final UserLoginRepository _userLoginRepository;
  var _phoneNumber = '';
  var _otp = '';
  var _isPhoneNumberValid = false;
  var _isOtpSent = false;

  get isOtpSent => _isOtpSent;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  set otp(String otp) => _otp = otp;

  set isPhoneNumberValid(bool isPhoneNumberValid) =>
      _isPhoneNumberValid = isPhoneNumberValid;

  void loginStatusListener(VerifyPhoneNumberState event) {
    if (event is VerifyPhoneNumberCompleted) {
      emit(UserLoginSuccess());
    } else if (event is VerifyPhoneNumberFailed) {
      emit(UserLoginShowToast(message: event.message));
    } else if (event is VerifyPhoneNumberCodeSent) {
      _isOtpSent = true;
      emit(UserLoginOtpSent());
    } else if (event is VerifyPhoneNumberTimeout) {
      _isOtpSent = false;
      emit(UserLoginOtpTimeout());
      emit(UserLoginShowToast(message: Strings.otpTimeout));
    }
  }

  void loginButtonClicked() {
    if (state is UserLoginLoading) return;

    if (_isOtpSent) {
      _verifyOtp();
    } else {
      _verifyPhoneNumber();
    }
  }

  void _verifyPhoneNumber() {
    if (!_isPhoneNumberValid) {
      emit(UserLoginShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    emit(UserLoginLoading());

    // verify phone number and send OTP
    _userLoginRepository.verifyPhoneNumber(phoneNumber: _phoneNumber);
  }

  void _verifyOtp() {
    if (_otp.length < 6) {
      emit(UserLoginShowToast(message: Strings.enterValidOtp));
      return;
    }

    emit(UserLoginLoading());

    // verify OTP and login user
    _userLoginRepository.signInWithCredential(smsCode: _otp);
  }

  @override
  Future<void> close() {
    _userLoginRepository.dispose();
    return super.close();
  }
}
