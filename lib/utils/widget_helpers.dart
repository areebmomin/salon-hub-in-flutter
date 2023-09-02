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
  static const textFieldHintStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: AppColors.inputText,
  );

  static const textFieldTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: AppColors.headingTextColor,
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: Strings.firaSans,
    color: Colors.white,
  );

  static const asteriskTextStyle = TextStyle(
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
}
