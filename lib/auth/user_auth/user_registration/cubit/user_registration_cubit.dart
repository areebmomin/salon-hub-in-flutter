import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';

part 'user_registration_state.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  UserRegistrationCubit() : super(UserRegistrationInitial());

  var _name = '';
  var _phoneNumber = '';
  var _isPhoneNumberValid = false;
  var _email = '';
  var _address = '';
  var _isTermsAndConditionAccepted = false;
  var _otp = '';

  set name(String name) => _name = name;

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  set isPhoneNumberValid(bool isValid) => _isPhoneNumberValid = isValid;

  set email(String email) => _email = email;

  set address(String address) => _address = address;

  bool get isTermsAndConditionAccepted => _isTermsAndConditionAccepted;

  set isTermsAndConditionAccepted(bool status) {
    _isTermsAndConditionAccepted = status;
    emit(UserRegistrationTermsAndCondition(isChecked: status));
  }

  set otp(String otp) => _otp = otp;

  void onRegisterButtonCLicked() {
    if (_name.isEmpty) {
      emit(UserRegistrationShowToast(message: Strings.enterName));
      return;
    }

    if (!_isPhoneNumberValid) {
      emit(UserRegistrationShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if(_email.isNotEmpty && !EmailValidator.validate(_email)) {
      emit(UserRegistrationShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (_address.isEmpty) {
      emit(UserRegistrationShowToast(message: Strings.enterAddress));
      return;
    }

    if (!_isTermsAndConditionAccepted) {
      emit(UserRegistrationShowToast(message: Strings.acceptTermsAndCondition));
      return;
    }

    emit(UserRegistrationOpenOtpPage());
  }

  void onSubmitButtonClicked() {
    if (_otp.length < 6) {
      emit(UserRegistrationShowToast(message: Strings.enterOtp));
      return;
    }

    emit(UserRegistrationGotoUserHomePage());
  }
}
