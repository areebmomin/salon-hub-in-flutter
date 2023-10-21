part of '../book_page.dart';

AppBar _appBar(BuildContext context, UserHomePageSalonInfo salonInfo) => AppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              backgroundImage: _getSalonImage(salonInfo.salonProfilePictureUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
            child: Text(
              salonInfo.salonName,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
        ],
      ),
      titleSpacing: 0,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: AppColors.headingTextColor,
      ),
      elevation: 3,
      shadowColor: Colors.grey.shade200,
      iconTheme: const IconThemeData(
        color: AppColors.headingTextColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.aboutSalonPage,
                  arguments: salonInfo);
            },
            child: const Icon(Icons.info_outline_rounded, size: 24),
          ),
        ),
      ],
    );

ImageProvider<Object> _getSalonImage(String url) {
  if (url.isNotEmpty) {
    return NetworkImage(url);
  } else {
    return const AssetImage(Assets.appLogo);
  }
}
