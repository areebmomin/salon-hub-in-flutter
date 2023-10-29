part of '../login_page.dart';

class LoginHeading extends StatelessWidget {
  const LoginHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, top: 24),
      child: Text(Strings.login, style: TextStyleConstants.pageHeading),
    );
  }
}
