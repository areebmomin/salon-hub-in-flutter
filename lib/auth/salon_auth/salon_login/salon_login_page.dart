import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:salon_hub/utils/index.dart';
import 'package:flutter/gestures.dart';
import 'cubit/salon_login_cubit.dart';

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
        if (state is ShowToast) {
          Fluttertoast.showToast(
              msg: state.message, toastLength: Toast.LENGTH_SHORT);
        } else if (state is Success) {
          // Navigate to Home page
          Navigator.pushReplacementNamed(context, Routes.saloonHomePage);
        }
      },
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailTextField(),
          PasswordTextField(),
          LoginButton(),
          RegisterNowText(),
        ],
      ),
    );
  }
}
