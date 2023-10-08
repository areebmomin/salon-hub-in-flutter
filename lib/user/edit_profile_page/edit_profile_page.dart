import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/user/edit_user_profile_page/edit_user_profile_repository.dart';
import 'package:salon_hub/user/edit_profile_page/cubit/user_edit_profile_page_cubit.dart';
import '../../utils/index.dart';

part 'widgets/address_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/email_text_field.dart';

part 'widgets/heading_edit_profile.dart';

part 'widgets/name_text_field.dart';

part 'widgets/save_button.dart';

part 'widgets/user_photo_upload.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<EditUserProfileRepository>(
      create: (context) => FirebaseEditUserProfileRepository(),
      child: BlocProvider(
        create: (context) => UserEditProfilePageCubit(
            RepositoryProvider.of<EditUserProfileRepository>(context)),
        child: BlocListener<UserEditProfilePageCubit, UserEditProfilePageState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Scaffold(
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
                      EmailTextField(),
                      AddressTextField(),
                      SaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
