import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../user/user_home_page.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../../saloon_auth/saloon_registration/saloon_registration_page.dart';

part 'widgets/heading_verify_otp.dart';
part 'widgets/verify_otp_text_field.dart';
part 'widgets/submit_button.dart';

class UserRegistrationOtpPage extends StatelessWidget {
  const UserRegistrationOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            CloseButtonWidget(),
            HeadingVerifyOtpWidget(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VerifyOtpTextField(),
                  SubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
