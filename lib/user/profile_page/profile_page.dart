import 'package:flutter/material.dart';
import '../../utils/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}

var _appBar = AppBar(
  title: const Text(Strings.profile),
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
