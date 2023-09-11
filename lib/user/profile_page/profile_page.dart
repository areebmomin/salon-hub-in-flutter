import 'package:flutter/material.dart';
import '../../utils/index.dart';

part 'widgets/user_profile_section.dart';

part 'widgets/booking_history_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserProfileSection(),
              BookingHistorySection(),
            ],
          ),
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
