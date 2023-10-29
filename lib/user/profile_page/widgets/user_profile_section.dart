part of '../profile_page.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserProfilePageCubit>();

    return BlocBuilder<UserProfilePageCubit, UserProfilePageState>(
      buildWhen: (previousState, state) {
        return state is LoadUserProfile;
      },
      builder: (context, state) {
        if (state is LoadUserProfile) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 210,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          Assets.userProfileBanner,
                          height: 155,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _getProfileImageOrIcon(state),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 61,
                                    left: 16,
                                    right: 2,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.userProfile.name,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                        style: TextStyleConstants.profileName,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        state.userProfile.phoneNumber,
                                        style: TextStyleConstants
                                            .profileSmallLight,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.gotoSalonEditProfilePage();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 56),
                            backgroundColor: AppColors.headingTextColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text(
                                Strings.editProfile,
                                style: TextStyleConstants.logoutButton,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          cubit.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 56),
                          backgroundColor: AppColors.primaryButtonBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 8),
                            Text(
                              Strings.logout,
                              style: TextStyleConstants.logoutButton,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getProfileImageOrIcon(UserProfilePageState state) {
    var image = state is LoadUserProfile && state.url.isNotEmpty
        ? FadeInImage.assetNetwork(
            placeholder: Assets.profilePic,
            image: state.url,
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          )
        : Image.asset(
            Assets.profilePic,
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          );

    return CircleAvatar(
      radius: 44,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipOval(child: image),
      ),
    );
  }
}
