part of '../about_salon_page.dart';

AppBar _appBar(BuildContext context) => AppBar(
      title: const Text(
        Strings.salonInfo,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: AppColors.headingTextColor,
        ),
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
    );
