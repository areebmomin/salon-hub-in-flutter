part of '../user_registration_page.dart';

class RegisterNowHeading extends StatelessWidget {
  const RegisterNowHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.registerNow,
        style: TextStyleConstants.pageHeading,
      ),
    );
  }
}
