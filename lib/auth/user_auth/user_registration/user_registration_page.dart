import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/address_text_field.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/close_button.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/email_text_field.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/heading_user_registration.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/name_text_field.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/phone_number_text_field.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/register_now_button.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/terms_and_conditions_checkbox.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/widgets/user_photo_upload.dart';

import '../../../user/user_home_page.dart';
import '../../../utils/index.dart';
import '../../index.dart';

class UserRegistrationWidget extends StatefulWidget {
  const UserRegistrationWidget({super.key});

  @override
  State<UserRegistrationWidget> createState() => _UserRegistrationWidgetState();
}

class _UserRegistrationWidgetState extends State<UserRegistrationWidget> {
  bool _isNameValid = false;
  bool _isPhoneNumberValid = false;
  bool _isAddressValid = false;
  bool _isTermsAndConditionsValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CloseButtonWidget(),
                const RegisterNowHeadingWidget(),
                const UserPhotoUploadWidget(),
                NameTextFieldWidget(_onNameValidated),
                RegisterPhoneNumberTextFieldWidget(_onPhoneNumberValidated),
                const EmailTextFieldWidget(),
                AddressTextFieldWidget(_onAddressValidated),
                TermsAndConditionCheckboxWidget(_isTermsAndConditionsValidated),
                RegisterNowButtonWidget(_onRegisterButtonCLicked),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onNameValidated(bool isValid) {
    _isNameValid = isValid;
  }

  void _onPhoneNumberValidated(bool isValid) {
    _isPhoneNumberValid = isValid;
  }

  void _onAddressValidated(bool isValid) {
    _isAddressValid = isValid;
  }

  void _isTermsAndConditionsValidated(bool isValid) {
    _isTermsAndConditionsValid = isValid;
  }

  void _onRegisterButtonCLicked() {
    if (!_isNameValid) {
      Fluttertoast.showToast(
          msg: Strings.enterName, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    if (!_isPhoneNumberValid) {
      Fluttertoast.showToast(
          msg: Strings.enterValidPhoneNumber, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    if (!_isAddressValid) {
      Fluttertoast.showToast(
          msg: Strings.enterAddress, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    if (!_isTermsAndConditionsValid) {
      Fluttertoast.showToast(
          msg: Strings.acceptTermsAndCondition,
          toastLength: Toast.LENGTH_SHORT);
      return;
    }

    // Navigate to Home page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const UserHomePage()),
      (route) => false,
    );
  }
}
