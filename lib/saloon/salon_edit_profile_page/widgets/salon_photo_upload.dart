part of '../salon_edit_profile_page.dart';

class SaloonPhotoUpload extends StatelessWidget {
  const SaloonPhotoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    //late var cubit = context.read<SaloonRegistrationCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 17),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // BlocBuilder<SaloonRegistrationCubit, SaloonRegistrationState>(
          //   buildWhen: (previousState, state) {
          //     return state is PhotoSelected;
          //   },
          //   builder: (context, state) {
          //     return CircleAvatar(
          //       backgroundImage: _getBackgroundImage(state),
          //       radius: 65,
          //     );
          //   },
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    Strings.uploadSaloonPicture,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyleConstants.uploadHeading,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      //cubit.setSaloonPhoto();
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

  // ImageProvider<Object>? _getBackgroundImage(SaloonRegistrationState state) {
  //   return state is PhotoSelected
  //       ? FileImage(state.profilePicture) as ImageProvider<Object>?
  //       : const AssetImage(Assets.userProfileDummy);
  // }
}
