part of '../saloon_registration_page.dart';

class SaloonPhotoUploadWidget extends StatefulWidget {
  const SaloonPhotoUploadWidget({super.key});

  @override
  State<SaloonPhotoUploadWidget> createState() =>
      _SaloonPhotoUploadWidgetState();
}

class _SaloonPhotoUploadWidgetState extends State<SaloonPhotoUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 17),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<SaloonRegistrationCubit, SaloonRegistrationState>(
            buildWhen: (previousState, state) {
              return state is SaloonRegistrationPhotoSelected;
            },
            builder: (context, state) {
              return CircleAvatar(
                backgroundImage: _getBackgroundImage(state),
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
                    Strings.uploadSaloonPicture,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      color: AppColors.headingTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: Strings.firaSans,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<SaloonRegistrationCubit>()
                          .getPhotoFromGallery();
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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
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

  ImageProvider<Object>? _getBackgroundImage(SaloonRegistrationState state) {
    return state is SaloonRegistrationPhotoSelected
        ? FileImage(state.profilePicture) as ImageProvider<Object>?
        : const AssetImage(Assets.userProfileDummy);
  }
}
