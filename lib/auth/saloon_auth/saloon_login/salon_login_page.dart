import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../saloon_registration/saloon_registration_page.dart';
import 'package:saloon_hub/saloon/saloon_home_page.dart';
import 'package:saloon_hub/utils/index.dart';
import 'package:flutter/gestures.dart';

part 'widgets/email_text_field.dart';

part 'widgets/login_button.dart';

part 'widgets/password_text_field.dart';

part 'widgets/register_now_text.dart';

class SalonLoginWidget extends StatefulWidget {
  const SalonLoginWidget({super.key});

  @override
  State<SalonLoginWidget> createState() => _SalonLoginWidgetState();
}

class _SalonLoginWidgetState extends State<SalonLoginWidget> {
  bool _isEmailValid = false;
  bool _isOtpValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EmailTextFieldWidget(_onEmailValidated),
        PasswordTextFieldWidget(_onOtpValidated),
        LoginButtonWidget(_onLoginButtonCLicked),
        const RegisterNowTextWidget(),
      ],
    );
  }

  void _onEmailValidated(bool isValid) {
    _isEmailValid = isValid;
  }

  void _onOtpValidated(isValid) {
    _isOtpValid = isValid;
  }

  void _onLoginButtonCLicked() {
    if (!_isEmailValid) {
      Fluttertoast.showToast(
          msg: Strings.enterValidEmail, toastLength: Toast.LENGTH_SHORT);
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
