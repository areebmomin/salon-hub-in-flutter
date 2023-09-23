part of '../salon_profile_page.dart';

class SalonOverview extends StatelessWidget {
  const SalonOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              Assets.userProfileBanner,
              height: 176,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 16),
          const Text(Strings.saloonName,
              style: TextStyleConstants.salonNameHeading),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              maxLines: 1,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.phone,
                      color: Colors.grey.shade600,
                      size: 18,
                    ),
                  ),
                  const TextSpan(
                    text: ' +91 8149311487',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              maxLines: 3,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.location_on_sharp,
                      color: Colors.grey.shade600,
                      size: 18,
                    ),
                  ),
                  const TextSpan(
                    text: ' ${Strings.businessAddressHint}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.salonEditProfilePage);
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
}
