part of '../edit_profile_page.dart';

class EditProfileHeading extends StatelessWidget {
  const EditProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.editProfileHeading,
        style: TextStyleConstants.pageHeading,
      ),
    );
  }
}
