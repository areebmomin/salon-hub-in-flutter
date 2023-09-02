import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../utils/index.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/gestures.dart';
import 'cubit/user_login_cubit.dart';

part 'widgets/login_button.dart';

part 'widgets/otp_text_field.dart';

part 'widgets/phone_number_text_field.dart';

part 'widgets/register_now_text.dart';

class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserLoginCubit, UserLoginState>(
      listener: (context, state) {
        if (state is ShowToast) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_SHORT,
          );
        } else if (state is Success) {
          // Navigate to Home page
          Navigator.pushReplacementNamed(context, Routes.userHomePage);
        }
      },
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PhoneNumberTextField(),
          OtpTextField(),
          LoginButton(),
          RegisterNowText(),
        ],
      ),
    );
  }
}
