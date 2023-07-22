import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_hub/user/user_home_page.dart';
import '../../../utils/index.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/gestures.dart';
import '../user_registration/user_registration_page.dart';

part 'widgets/login_button.dart';
part 'widgets/otp_text_field.dart';
part 'widgets/phone_number_text_field.dart';
part 'widgets/register_now_text.dart';

class UserLoginWidget extends StatefulWidget {
  const UserLoginWidget({super.key});

  @override
  State<UserLoginWidget> createState() => _UserLoginWidgetState();
}

class _UserLoginWidgetState extends State<UserLoginWidget> {
  bool _isPhoneNumberValid = false;
  bool _isOtpValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PhoneNumberTextFieldWidget(_onPhoneNumberValidated),
        OtpTextFieldWidget(_onOtpValidated),
        LoginButtonWidget(_onLoginButtonCLicked),
        const RegisterNowTextWidget(),
      ],
    );
  }

  void _onPhoneNumberValidated(bool isValid) {
    _isPhoneNumberValid = isValid;
  }

  void _onOtpValidated(isValid) {
    _isOtpValid = isValid;
  }

  void _onLoginButtonCLicked() {
    if (!_isPhoneNumberValid) {
      Fluttertoast.showToast(
          msg: Strings.enterValidPhoneNumber, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    if (!_isOtpValid) {
      Fluttertoast.showToast(
          msg: Strings.enterValidOtp, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    // Navigate to Home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const UserHomePage()),
    );
  }
}
