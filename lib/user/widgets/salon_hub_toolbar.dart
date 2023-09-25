part of '../user_home_page.dart';

AppBar appBar(BuildContext context, String? imageUrl) => AppBar(
      title: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Assets.appLogo),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Text(
              Strings.appNameToolbar,
              style: TextStyle(
                fontSize: 28,
                fontFamily: Strings.playBall,
                fontWeight: FontWeight.w500,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
        ],
      ),
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.grey.shade200,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.userProfilePage);
            },
            child: _getProfileImageOrIcon(context, null),
          ),
        ),
      ],
    );

Widget _getProfileImageOrIcon(BuildContext context, String? imageUrl) {
  if (imageUrl != null) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(imageUrl),
      radius: 14,
    );
  } else {
    return const Image(
      image: AssetImage(Assets.profilePic),
      width: 28,
      height: 28,
    );
  }
}
