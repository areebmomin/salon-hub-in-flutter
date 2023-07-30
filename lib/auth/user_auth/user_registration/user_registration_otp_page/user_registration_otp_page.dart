import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../utils/index.dart';
import '../cubit/user_registration_cubit.dart';

part 'widgets/heading_verify_otp.dart';

part 'widgets/verify_otp_text_field.dart';

part 'widgets/submit_button.dart';

part 'widgets/close_button.dart';

class UserRegistrationOtpPage extends StatelessWidget {
  final Function() onCloseButtonClicked;

  const UserRegistrationOtpPage({
    super.key,
    required this.onCloseButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<UserRegistrationCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              CloseButtonWidget(onCloseButtonClicked: onCloseButtonClicked),
              const HeadingVerifyOtpWidget(),
              const Expanded(
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
      ),
    );
  }
}
