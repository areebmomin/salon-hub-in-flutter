part of '../user_login_page.dart';

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
