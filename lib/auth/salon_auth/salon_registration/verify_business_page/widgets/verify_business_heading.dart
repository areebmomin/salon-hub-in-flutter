part of '../verify_business_page.dart';

class VerifyBusinessHeading extends StatelessWidget {
  const VerifyBusinessHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.verifyBusiness,
        style: TextStyleConstants.pageHeading,
      ),
    );
  }
}
