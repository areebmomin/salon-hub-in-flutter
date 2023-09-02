part of '../salon_login_page.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonLoginCubit>();
    var screenWidth = MediaQuery.of(context).size.width;
    var otpBoxWidth = (screenWidth - 19 - 19 - (4 * 5)) / 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 18),
          child: Text(
            Strings.passcode,
            style: TextStyleConstants.textFieldTextStyle,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 19, right: 19, top: 9, bottom: 12),
          child: OTPTextField(
            length: 6,
            fieldWidth: otpBoxWidth,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: AppColors.inputFieldBackground,
              borderColor: AppColors.inputFieldBackground,
              enabledBorderColor: AppColors.inputFieldBackground,
            ),
            style: TextStyleConstants.textFieldTextStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            onChanged: (code) {
              cubit.password = code.trim();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: GestureDetector(
            onTap: () {
              cubit.forgotPasscodeButtonClicked();
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
