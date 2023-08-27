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
  ) : super(Initial()) {
    _userLoginRepository.status.listen(loginStatusListener);
  }

  final UserLoginRepository _userLoginRepository;
  final UserRegistrationRepository _userRegistrationRepository;
  final data = UserRegistrationData();
  var otp = '';
  File? _imageFile;

  set isTermsAndConditionAccepted(bool status) {
    data.isTermsAndConditionAccepted = status;
    emit(TermsAndCondition(isChecked: status));
  }

  void loginStatusListener(VerifyPhoneNumberState event) {
    if (event is VerifyPhoneNumberCompleted) {
      _addDataAndUploadPhoto(event.uid);
    } else if (event is VerifyPhoneNumberFailed) {
      emit(ShowToast(message: event.message));
    } else if (event is VerifyPhoneNumberCodeSent) {
      emit(OpenOtpPage());
    } else if (event is VerifyPhoneNumberTimeout) {
      emit(ShowToast(message: Strings.otpTimeout));
    }
  }

  void onRegisterButtonCLicked() {
    if (state is Loading) return;

    if (data.name.isEmpty) {
      emit(ShowToast(message: Strings.enterName));
      return;
    }

    if (!data.isPhoneNumberValid) {
      emit(ShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if (data.email.isNotEmpty && !EmailValidator.validate(data.email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (data.address.isEmpty) {
      emit(ShowToast(message: Strings.enterAddress));
      return;
    }

    if (!data.isTermsAndConditionAccepted) {
      emit(ShowToast(message: Strings.acceptTermsAndCondition));
      return;
    }

    emit(Loading());

    // verify phone number and send OTP
    _userLoginRepository.verifyPhoneNumber(phoneNumber: data.phoneNumber);
  }

  void onSubmitButtonClicked() {
    if (state is OtpLoading) return;

    if (otp.length < 6) {
      emit(ShowToast(message: Strings.enterOtp));
      return;
    }

    emit(OtpLoading());

    // verify OTP and login user
    _userLoginRepository.signInWithCredential(smsCode: otp);
  }

  void getPhotoFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: _imageFile!));
    }
  }

  void closeButtonClicked() {
    emit(CloseButtonClicked());
  }

  void otpPageCloseButtonClicked() {
    emit(OtpCloseButtonClicked());
  }

  void _addDataAndUploadPhoto(String uid) {
    _userRegistrationRepository
        .addNewUserDataAndPhoto(data, uid, _imageFile)
        .listen((dataEvent) {
      if (dataEvent is UserRegistrationRepositorySuccess) {
        emit(GotoUserHomePage());
      } else if (dataEvent is UserRegistrationRepositoryFailure) {
        emit(ShowToast(message: dataEvent.message));
      }
    });
  }

  @override
  Future<void> close() {
    _userLoginRepository.dispose();
    return super.close();
  }
}
