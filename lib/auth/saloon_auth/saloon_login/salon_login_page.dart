import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_login/widgets/login_button.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_login/widgets/password_text_field.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_login/widgets/phone_number_text_field.dart';
import 'package:saloon_hub/auth/saloon_auth/saloon_login/widgets/register_now_text.dart';
import 'package:saloon_hub/saloon/saloon_home_page.dart';
import 'package:saloon_hub/utils/index.dart';

class SalonLoginWidget extends StatefulWidget {
  const SalonLoginWidget({super.key});

  @override
  State<SalonLoginWidget> createState() => _SalonLoginWidgetState();
}

class _SalonLoginWidgetState extends State<SalonLoginWidget> {
  bool _isPhoneNumberValid = false;
  bool _isOtpValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PhoneNumberTextFieldWidget(_onPhoneNumberValidated),
        PasswordTextFieldWidget(_onOtpValidated),
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
      MaterialPageRoute(builder: (context) => const SaloonHomePage()),
    );
  }
}
