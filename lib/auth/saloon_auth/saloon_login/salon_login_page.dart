import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../saloon_registration/saloon_registration_page.dart';
import 'package:saloon_hub/saloon/saloon_home_page.dart';
import 'package:saloon_hub/utils/index.dart';
import 'package:flutter/gestures.dart';

import 'cubit/saloon_login_cubit.dart';

part 'widgets/email_text_field.dart';

part 'widgets/login_button.dart';

part 'widgets/password_text_field.dart';

part 'widgets/register_now_text.dart';

class SalonLoginWidget extends StatelessWidget {
  const SalonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaloonLoginCubit, SaloonLoginState>(
      listener: (context, state) {
        if (state is SaloonLoginShowToast) {
          Fluttertoast.showToast(
              msg: state.message, toastLength: Toast.LENGTH_SHORT);
        } else if (state is SaloonLoginSuccess) {
          // Navigate to Home page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SaloonHomePage()),
          );
        }
      },
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailTextFieldWidget(),
          PasswordTextFieldWidget(),
          LoginButtonWidget(),
          RegisterNowTextWidget(),
        ],
      ),
    );
  }
}
