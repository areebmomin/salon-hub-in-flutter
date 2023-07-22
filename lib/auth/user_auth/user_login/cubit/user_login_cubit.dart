import 'package:auth_repository/user_login/user_login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit(this._userLoginRepository) : super(UserLoginInitial());

  final UserLoginRepository _userLoginRepository;
  String _phoneNumber = '';
  String _otp = '';
  bool _isPhoneNumberValid = false;
  bool _isOtpSent = false;

  get isOtpSent => _isOtpSent;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  set otp(String otp) => _otp = otp;

  set isPhoneNumberValid(bool isPhoneNumberValid) =>
      _isPhoneNumberValid = isPhoneNumberValid;

  void loginButtonClicked() {
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

    // verify phone number and send OTP
    //_userLoginRepository.verifyPhoneNumber(phoneNumber: _phoneNumber);

    _isOtpSent = true;
    emit(UserLoginOtpSent());
  }

  void _verifyOtp() {
    if (_otp.length < 6) {
      emit(UserLoginShowToast(message: Strings.enterValidOtp));
      return;
    }

    emit(UserLoginSuccess());
  }
}
