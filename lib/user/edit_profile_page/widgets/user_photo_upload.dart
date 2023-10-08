part of '../edit_profile_page.dart';

class UserPhotoUpload extends StatelessWidget {
  const UserPhotoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserEditProfilePageCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 17),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<UserEditProfilePageCubit, UserEditProfilePageState>(
            buildWhen: (previousState, state) {
              return state is PhotoSelected || state is LoadProfileData;
            },
            builder: (context, state) {
              return CircleAvatar(
                backgroundImage: _getBackgroundImage(cubit, state),
                radius: 65,
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    Strings.uploadProfilePicture,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyleConstants.uploadHeading,
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      cubit.getPhotoFromGallery();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.inputFieldBackground,
                      fixedSize: const Size(138, 45),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload),
                        SizedBox(width: 8),
                        Text(
                          Strings.browse,
                          style: TextStyleConstants.browseButton,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider<Object>? _getBackgroundImage(
    UserEditProfilePageCubit cubit,
    UserEditProfilePageState state,
  ) {
    if (state is PhotoSelected) {
      return FileImage(state.profilePicture);
    } else if (state is LoadProfileData && cubit.url.isNotEmpty) {
      return NetworkImage(cubit.url);
    } else {
      return const AssetImage(Assets.userProfileDummy);
    }
  }
}
