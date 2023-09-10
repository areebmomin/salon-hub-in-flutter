part of '../profile_page.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                        _getProfileImageOrIcon(context, null),
                        const Flexible(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 61, left: 16, right: 2),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Steve Smith',
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: TextStyleConstants.profileName,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '+91 8149311487',
                                  style: TextStyleConstants.profileSmallLight,
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
                      //cubit.saveDetailsButtonClicked();
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
                    //cubit.saveDetailsButtonClicked();
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
  }

  Widget _getProfileImageOrIcon(BuildContext context, String? imageUrl) {
    var image = imageUrl != null
        ? Image.network(
            imageUrl,
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
        child: ClipOval(
          child: image,
        ),
      ),
    );
  }
}
