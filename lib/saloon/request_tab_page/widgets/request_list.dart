part of '../request_tab_view.dart';

class RequestList extends StatelessWidget {
  const RequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 24,
          right: 16,
          bottom: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _getProfileImageOrIcon(context, null),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User name',
                        style: TextStyleConstants.userNameScheduleCard,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      InkWell(
                        onTap: () {
                          _launchUrl('8149311487');
                        },
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.phone,
                                  size: 16,
                                  color: AppColors.inputText,
                                ),
                              ),
                              TextSpan(
                                text: ' +91 8149311487',
                                style: TextStyleConstants.phoneNumberScheduleCard,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              Strings.services,
              style: TextStyleConstants.subHeadingScheduleCard,
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                _buildChip('Gamer'),
                _buildChip('Hacker'),
                _buildChip('Develop'),
                _buildChip('Racer'),
                _buildChip('Traveller'),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  Strings.dateColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                SizedBox(width: 4),
                Text(
                  'data',
                  style: TextStyleConstants.valueTextScheduleCard,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  Strings.timeColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                SizedBox(width: 4),
                Text(
                  'data',
                  style: TextStyleConstants.valueTextScheduleCard,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  Strings.noteColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                SizedBox(width: 4),
                Text(
                  'data',
                  style: TextStyleConstants.valueTextScheduleCard,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _declineDialogBuilder(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 40),
                        backgroundColor: AppColors.headingTextColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        elevation: 1,
                      ),
                      child: const Text(
                        Strings.decline,
                        style: TextStyleConstants.requestActionButton,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _acceptDialogBuilder(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 40),
                        backgroundColor: AppColors.primaryButtonBackground,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        elevation: 1,
                      ),
                      child: const Text(
                        Strings.accept,
                        style: TextStyleConstants.requestActionButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProfileImageOrIcon(BuildContext context, String? imageUrl) {
    var image = imageUrl != null
        ? Image.network(imageUrl, fit: BoxFit.fill)
        : Image.asset(Assets.profilePic, fit: BoxFit.fill);

    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: ClipOval(child: image),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      elevation: 0,
      label: Text(label),
      labelPadding: const EdgeInsets.only(left: 4, top: 0, right: 4, bottom: 0),
      labelStyle: TextStyleConstants.chipTextScheduleCard,
      backgroundColor: AppColors.inputFieldBackground,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }

  Future<void> _launchUrl(String phoneNumber) async {
    if (!await launchUrl(Uri.parse('tel:$phoneNumber'))) {
      Fluttertoast.showToast(
          msg: Strings.couldNotLaunch, toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<void> _declineDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      Strings.yourReplyColon,
                      style: TextStyleConstants.subHeadingScheduleCard,
                    ),
                    SizedBox(
                      height: 32,
                      child: TextField(
                        onSubmitted: (reply) {},
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.headingTextColor,
                    ),
                    child: const Text(Strings.decline),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _acceptDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      Strings.yourReplyColon,
                      style: TextStyleConstants.subHeadingScheduleCard,
                    ),
                    SizedBox(
                      height: 32,
                      child: TextField(
                        onSubmitted: (reply) {},
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButtonBackground,
                    ),
                    child: const Text(Strings.accept),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
