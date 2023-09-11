import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../utils/index.dart';

part 'widgets/address_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/email_text_field.dart';

part 'widgets/heading_edit_profile.dart';

part 'widgets/name_text_field.dart';

part 'widgets/phone_number_text_field.dart';

part 'widgets/save_button.dart';

part 'widgets/user_photo_upload.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CloseButton(),
                EditProfileHeading(),
                UserPhotoUpload(),
                NameTextField(),
                RegisterPhoneNumberTextField(),
                EmailTextField(),
                AddressTextField(),
                SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
