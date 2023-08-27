part of '../business_details_page.dart';

class BusinessDetailsHeading extends StatelessWidget {
  const BusinessDetailsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.businessDetails,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.headingTextColor,
          fontFamily: Strings.firaSans,
        ),
      ),
    );
  }
}
