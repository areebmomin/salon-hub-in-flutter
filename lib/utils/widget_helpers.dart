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
}
