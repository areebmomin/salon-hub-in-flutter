import 'package:flutter/material.dart';
import 'index.dart';

class NoOverscrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class TextFieldConstants {
  static const curvedUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  static const transparentInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
}

class Dividers {
  static const lightDivider = Divider(
    thickness: 1,
    indent: 16,
    endIndent: 16,
    height: 40,
  );
}

class TextStyleConstants {
  static const textFieldHint = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: AppColors.inputText,
  );

  static const textField = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: AppColors.headingTextColor,
  );

  static const button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: Strings.firaSans,
    color: Colors.white,
  );

  static const asterisk = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Colors.red,
  );

  static const browseButton = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const registerNow = TextStyle(
    color: AppColors.headingTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const pageHeading = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: AppColors.headingTextColor,
    fontFamily: Strings.firaSans,
  );

  static const lightSubHeading = TextStyle(
    fontSize: 20,
    fontFamily: Strings.firaSans,
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
  );

  static const uploadHeading = TextStyle(
    color: AppColors.headingTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: Strings.firaSans,
  );

  static const logoutButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: Strings.firaSans,
    color: Colors.white,
  );

  static const profileSmallLight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextColor,
  );

  static const profileName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: Strings.firaSans,
  );

  static const bookingHistoryHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: Strings.firaSans,
  );

  static const bookingHistorySaloonHeading = TextStyle(
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: Strings.firaSans,
  );

  static const bookingHistoryStatus = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.inputText,
  );

  static const bookingHistoryListTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.headingTextColor,
    fontFamily: Strings.firaSans,
  );

  static const bookingHistoryListValue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextColor,
    fontFamily: Strings.firaSans,
  );

  static const bookSlotHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: Strings.firaSans,
    color: AppColors.headingTextColor,
  );

  static const bookSlotSubHeading = TextStyle(
    fontSize: 16,
    color: AppColors.headingTextColor,
    fontWeight: FontWeight.w500,
  );

  static const serviceChipSelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const serviceChipUnselected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextColor,
  );

  static const timeColon = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

  static const salonNameHeading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    fontFamily: Strings.firaSans,
    color: AppColors.headingTextColor,
  );

  static const salonInfoCardHeading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFamily: Strings.firaSans,
    color: AppColors.headingTextColor,
  );
}
