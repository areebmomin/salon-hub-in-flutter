part of '../salon_edit_profile_page.dart';

class BusinessDetailsHeading extends StatelessWidget {
  const BusinessDetailsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.editBusinessDetails,
        style: TextStyleConstants.pageHeading,
      ),
    );
  }
}
