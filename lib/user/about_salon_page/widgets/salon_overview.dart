part of '../about_salon_page.dart';

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
            child: InkWell(
              onTap: () {
                _launchUrl('8149311487');
              },
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
        ],
      ),
    );
  }

  Future<void> _launchUrl(String phoneNumber) async {
    if (!await launchUrl(Uri.parse('tel:$phoneNumber'))) {
      Fluttertoast.showToast(
          msg: Strings.couldNotLaunch, toastLength: Toast.LENGTH_SHORT);
    }
  }
}
