part of '../request_tab_view.dart';

class DeclinedRequestList extends StatelessWidget {
  final BookingData bookingData;

  const DeclinedRequestList(this.bookingData, {super.key});

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
      child: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
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
                    _getProfileImageOrIcon(
                        context, bookingData.userProfilePictureUrl),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookingData.userName,
                            style: TextStyleConstants.userNameScheduleCard,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          InkWell(
                            onTap: () {
                              _launchUrl(bookingData.userPhoneNumber);
                            },
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              text: TextSpan(
                                children: [
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: AppColors.inputText,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${bookingData.userPhoneNumber}',
                                    style: TextStyleConstants
                                        .phoneNumberScheduleCard,
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
                  children:
                      bookingData.services.map((e) => _buildChip(e)).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      Strings.timeColon,
                      style: TextStyleConstants.subHeadingScheduleCard,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bookingData.serviceTime.toString(),
                      style: TextStyleConstants.valueTextScheduleCard,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<ScheduleOption>(
              icon: const Icon(
                Icons.more_vert_rounded,
                color: AppColors.optionColor,
              ),
              padding: const EdgeInsets.only(top: 8),
              onSelected: (item) {
                switch (item) {
                  case ScheduleOption.notes:
                    {
                      _notesDialogBuilder(context, bookingData);
                    }
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ScheduleOption>>[
                const PopupMenuItem<ScheduleOption>(
                  value: ScheduleOption.notes,
                  child: Text(Strings.notes),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProfileImageOrIcon(BuildContext context, String imageUrl) {
    var image = imageUrl.isNotEmpty
        ? Image.network(imageUrl, fit: BoxFit.fill, height: 48, width: 48)
        : Image.asset(Assets.profilePic,
            fit: BoxFit.fill, height: 48, width: 48);

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

  Future<void> _notesDialogBuilder(
    BuildContext context,
    BookingData bookingData,
  ) {
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
                      Strings.noteColon,
                      style: TextStyleConstants.subHeadingScheduleCard,
                    ),
                    Text(
                      bookingData.userNote,
                      style: TextStyleConstants.valueTextScheduleCard,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      Strings.yourReplyColon,
                      style: TextStyleConstants.subHeadingScheduleCard,
                    ),
                    Text(
                      bookingData.salonNote,
                      style: TextStyleConstants.valueTextScheduleCard,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 2),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      Strings.okay,
                      style: TextStyleConstants.dialogButton,
                    ),
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
