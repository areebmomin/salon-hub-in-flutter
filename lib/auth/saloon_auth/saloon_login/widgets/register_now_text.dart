part of '../salon_login_page.dart';

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
                  Navigator.pushNamed(context, Routes.saloonRegistration);
                },
            ),
          ],
        ),
      ),
    );
  }
}
