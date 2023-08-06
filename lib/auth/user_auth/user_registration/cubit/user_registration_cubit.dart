import 'dart:io';
import 'package:auth_repository/user_login/user_login_repository.dart';
import 'package:auth_repository/user_registration/models/user_registration_data.dart';
import 'package:auth_repository/user_registration/user_registration_repository.dart';
import 'package:auth_repository/user_registration/user_registration_repository_states.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/strings.dart';

part 'user_registration_state.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  UserRegistrationCubit(
    this._userLoginRepository,
    this._userRegistrationRepository,
  ) : super(UserRegistrationInitial()) {
    _userLoginRepository.status.listen(loginStatusListener);
  }

  final UserLoginRepository _userLoginRepository;
  final UserRegistrationRepository _userRegistrationRepository;
  final _data = UserRegistrationData();
  var _otp = '';
  File? _imageFile;

  set name(String name) => _data.name = name;

  set phoneNumber(String phoneNumber) => _data.phoneNumber = phoneNumber;

  set isPhoneNumberValid(bool isValid) => _data.isPhoneNumberValid = isValid;

  set email(String email) => _data.email = email;

  set address(String address) => _data.address = address;

  bool get isTermsAndConditionAccepted => _data.isTermsAndConditionAccepted;

  set isTermsAndConditionAccepted(bool status) {
    _data.isTermsAndConditionAccepted = status;
    emit(UserRegistrationTermsAndCondition(isChecked: status));
  }

  set otp(String otp) => _otp = otp;

  void loginStatusListener(VerifyPhoneNumberState event) {
    if (event is VerifyPhoneNumberCompleted) {
      _userRegistrationRepository
          .addNewUserDataAndPhoto(_data, event.uid)
          .listen((dataEvent) {
        if (dataEvent is UserRegistrationRepositorySuccess) {
          emit(UserRegistrationGotoUserHomePage());
        } else if (dataEvent is UserRegistrationRepositoryFailure) {
          emit(UserRegistrationShowToast(message: dataEvent.message));
        }
      });
    } else if (event is VerifyPhoneNumberFailed) {
      emit(UserRegistrationShowToast(message: event.message));
    } else if (event is VerifyPhoneNumberCodeSent) {
      emit(UserRegistrationOpenOtpPage());
    } else if (event is VerifyPhoneNumberTimeout) {
      emit(UserRegistrationShowToast(message: Strings.otpTimeout));
    }
  }

  void onRegisterButtonCLicked() {
    if (state is UserRegistrationLoading) return;

    if (_data.name.isEmpty) {
      emit(UserRegistrationShowToast(message: Strings.enterName));
      return;
    }

    if (!_data.isPhoneNumberValid) {
      emit(UserRegistrationShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if (_data.email.isNotEmpty && !EmailValidator.validate(_data.email)) {
      emit(UserRegistrationShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (_data.address.isEmpty) {
      emit(UserRegistrationShowToast(message: Strings.enterAddress));
      return;
    }

    if (!_data.isTermsAndConditionAccepted) {
      emit(UserRegistrationShowToast(message: Strings.acceptTermsAndCondition));
      return;
    }

    emit(UserRegistrationLoading());

    // verify phone number and send OTP
    _userLoginRepository.verifyPhoneNumber(phoneNumber: _data.phoneNumber);
  }

  void onSubmitButtonClicked() {
    if (state is UserRegistrationOtpLoading) return;

    if (_otp.length < 6) {
      emit(UserRegistrationShowToast(message: Strings.enterOtp));
      return;
    }

    emit(UserRegistrationOtpLoading());

    // verify OTP and login user
    _userLoginRepository.signInWithCredential(smsCode: _otp);
  }

  void getPhotoFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      emit(UserRegistrationPhotoSelected(profilePicture: _imageFile!));
    }
  }

  void userRegistrationPageCloseButtonClicked() {
    emit(UserRegistrationCloseButtonClicked());
  }

  void userRegistrationOtpPageCloseButtonClicked() {
    emit(UserRegistrationOtpCloseButtonClicked());
  }

  @override
  Future<void> close() {
    _userLoginRepository.dispose();
    return super.close();
  }
}
