part of '../about_salon_page.dart';

class SalonOverview extends StatelessWidget {
  final UserHomePageSalonInfo _salonInfo;

  const SalonOverview(this._salonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: _getProfilePicture(_salonInfo.salonProfilePictureUrl),
          ),
          const SizedBox(height: 16),
          Text(_salonInfo.salonName,
              style: TextStyleConstants.salonNameHeading),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: InkWell(
              onTap: () {
                _launchDialPad(_salonInfo.phoneNumber);
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
                    TextSpan(
                      text: ' ${_salonInfo.phoneNumber}',
                      style: const TextStyle(
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
                  TextSpan(
                    text: ' ${_salonInfo.salonAddress}',
                    style: const TextStyle(
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

  Widget _getProfilePicture(String url) {
    return url.isEmpty
        ? Image.asset(Assets.userProfileBanner, height: 176, fit: BoxFit.fill)
        : Image.network(url, height: 176, fit: BoxFit.fill);
  }

  Future<void> _launchDialPad(String phoneNumber) async {
    if (!await launchUrl(Uri.parse('tel:$phoneNumber'))) {
      Fluttertoast.showToast(
          msg: Strings.couldNotLaunch, toastLength: Toast.LENGTH_SHORT);
    }
  }
}
