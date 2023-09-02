part of '../user_login_page.dart';

class RegisterNowText extends StatelessWidget {
  const RegisterNowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: Strings.dontHaveAccount,
          style: TextStyleConstants.lightSubHeading,
          children: [
            TextSpan(
              text: Strings.registerNow,
              style: TextStyleConstants.registerNow,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(
                      context, Routes.userRegistrationFlowStartPage);
                },
            ),
          ],
        ),
      ),
    );
  }
}
