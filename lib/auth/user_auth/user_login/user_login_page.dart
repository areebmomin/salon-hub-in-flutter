import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:saloon_hub/auth/user_auth/index.dart';
import 'package:saloon_hub/user/user_home_page.dart';

import '../../../utils/index.dart';

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

class PhoneNumberTextFieldWidget extends StatelessWidget {
  final Function(bool isValid) onInputValidated;

  const PhoneNumberTextFieldWidget(this.onInputValidated, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 21),
          child: Text(
            Strings.mobileNo,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 11),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {},
            onInputValidated: (isValid) {
              onInputValidated(isValid);
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              leadingPadding: 20,
              setSelectorButtonAsPrefixIcon: true,
            ),
            textStyle: const TextStyle(
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            selectorTextStyle: const TextStyle(
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            inputDecoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: Strings.hintPhoneNumber,
              suffixIcon: Icon(Icons.phone),
              hintStyle: TextStyle(
                color: AppColors.inputText,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OtpTextFieldWidget extends StatelessWidget {
  final Function(bool isValid) onInputValidated;
  static const int _otpLength = 6;

  const OtpTextFieldWidget(this.onInputValidated, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 8),
          child: Text(
            Strings.otp,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 12),
          child: OTPTextField(
            length: _otpLength,
            fieldWidth: 56,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
            keyboardType: TextInputType.number,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: AppColors.inputFieldBackground,
              borderColor: AppColors.inputFieldBackground,
              enabledBorderColor: AppColors.inputFieldBackground,
            ),
            style: const TextStyle(
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            onChanged: (code) {
              onInputValidated(code.length == _otpLength);
            },
          ),
        ),
      ],
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final Function() onCLicked;

  const LoginButtonWidget(this.onCLicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          onCLicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: const Text(
          Strings.loginButton,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.firaSans,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RegisterNowTextWidget extends StatelessWidget {
  const RegisterNowTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: Strings.dontHaveAccount,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: Strings.firaSans,
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: Strings.registerNow,
              style: const TextStyle(
                color: AppColors.headingTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserRegistrationWidget(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
