part of '../user_home_page.dart';

class SaloonHubToolbar extends StatelessWidget {
  const SaloonHubToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: const Offset(2.0, 2.0),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Assets.appLogo),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 12, bottom: 12),
            child: Text(
              Strings.appNameToolbar,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.userProfilePage);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: _getBackgroundImages(null),
                radius: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider<Object> _getBackgroundImages(File? imageView) {
    return imageView != null
        ? FileImage(imageView) as ImageProvider<Object>
        : const AssetImage(Assets.profilePic);
  }
}
