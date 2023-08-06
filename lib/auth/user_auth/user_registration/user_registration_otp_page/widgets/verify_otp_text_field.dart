part of '../user_registration_otp_page.dart';

class VerifyOtpTextField extends StatelessWidget {
  const VerifyOtpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var otpBoxWidth = (screenWidth - 19 - 19 - (4 * 5)) / 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 8),
          child: Text(
            Strings.enterOtp,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 20),
          child: OTPTextField(
            length: 6,
            fieldWidth: otpBoxWidth,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
            keyboardType: TextInputType.number,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: AppColors.inputFieldBackground,
              borderColor: AppColors.inputFieldBackground,
              enabledBorderColor: AppColors.inputFieldBackground,
            ),
            style: const TextStyle(
              color: AppColors.headingTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            onChanged: (code) {
              context.read<UserRegistrationCubit>().otp = code;
            },
          ),
        ),
      ],
    );
  }
}
