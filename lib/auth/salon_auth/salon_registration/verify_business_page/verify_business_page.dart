import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../utils/index.dart';
import '../cubit/salon_registration_cubit.dart';

part 'widgets/close_button.dart';

part 'widgets/verify_business_heading.dart';

part 'widgets/email_text_field.dart';

part 'widgets/password_text_field.dart';

part 'widgets/register_now_button.dart';

class VerifyBusinessPage extends StatelessWidget {
  const VerifyBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SaloonRegistrationCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoOverscrollBehaviour(),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CloseButton(),
                VerifyBusinessHeading(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RegisterEmailTextField(),
                      PasswordTextField(),
                      RegisterNowButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
