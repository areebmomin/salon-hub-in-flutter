import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:saloon_hub/auth/user_auth/user_registration/cubit/user_registration_cubit.dart';
import '../../../../utils/index.dart';

part 'widgets/address_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/email_text_field.dart';

part 'widgets/heading_user_registration.dart';

part 'widgets/name_text_field.dart';

part 'widgets/phone_number_text_field.dart';

part 'widgets/register_now_button.dart';

part 'widgets/terms_and_conditions_checkbox.dart';

part 'widgets/user_photo_upload.dart';

class UserRegistrationPage extends StatelessWidget {

  const UserRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<UserRegistrationCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoOverscrollBehaviour(),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CloseButtonWidget(),
                  RegisterNowHeadingWidget(),
                  UserPhotoUploadWidget(),
                  NameTextFieldWidget(),
                  RegisterPhoneNumberTextFieldWidget(),
                  EmailTextFieldWidget(),
                  AddressTextFieldWidget(),
                  TermsAndConditionCheckboxWidget(),
                  RegisterNowButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Navigator.pushNamed(
// context, Routes.userRegistrationOtpPage);
