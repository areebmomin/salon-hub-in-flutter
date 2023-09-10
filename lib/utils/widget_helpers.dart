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
}
