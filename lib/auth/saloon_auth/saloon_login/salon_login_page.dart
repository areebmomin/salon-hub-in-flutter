import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:saloon_hub/auth/saloon_auth/index.dart';
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SaloonHomePage()),
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

class PasswordTextFieldWidget extends StatelessWidget {
  final Function(bool isValid) onInputValidated;
  static const int _otpLength = 6;

  const PasswordTextFieldWidget(this.onInputValidated, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 8),
          child: Text(
            Strings.passcode,
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
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: 'msg');
            },
            child: const Text(
              Strings.forgotPasscode,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                fontFamily: Strings.firaSans,
                fontWeight: FontWeight.w500,
                color: AppColors.headingTextColor,
              ),
            ),
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
                      builder: (context) => const SaloonRegistrationWidget(),
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
