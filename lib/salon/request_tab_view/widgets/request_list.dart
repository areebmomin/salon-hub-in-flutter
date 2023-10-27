part of '../request_tab_view.dart';

class RequestList extends StatelessWidget {
  final int index;
  final BookingData bookingData;

  const RequestList(this.index, this.bookingData, {super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<RequestTabCubit>();

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
                _getProfileImageOrIcon(bookingData.userProfilePictureUrl),
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
                                style:
                                    TextStyleConstants.phoneNumberScheduleCard,
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
              children: bookingData.services.map((e) => _buildChip(e)).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  Strings.dateColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                const SizedBox(width: 8),
                Text(
                  bookingData.formattedDate,
                  style: TextStyleConstants.valueTextScheduleCard,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  Strings.timeColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                const SizedBox(width: 8),
                Text(
                  '${bookingData.serviceTime.startTime.toString()} - ${bookingData.serviceTime.endTime.toString()}',
                  style: TextStyleConstants.valueTextScheduleCard,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  Strings.noteColon,
                  style: TextStyleConstants.subHeadingScheduleCard,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    bookingData.userNote,
                    style: TextStyleConstants.valueTextScheduleCard,
                  ),
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
                        _declineDialogBuilder(context, (salonNote) {
                          cubit.declineButtonClicked(index, salonNote);
                        });
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
                        _acceptDialogBuilder(context, (salonNote) {
                          cubit.acceptButtonClicked(index, salonNote);
                        });
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

  Widget _getProfileImageOrIcon(String imageUrl) {
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

  Future<void> _declineDialogBuilder(
      BuildContext context, Function(String) onDeclineClicked) {
    String salonNote = '';
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
                        onChanged: (note) {
                          salonNote = note;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 2),
                  child: ElevatedButton(
                    onPressed: () {
                      onDeclineClicked(salonNote);
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

  Future<void> _acceptDialogBuilder(
      BuildContext context, Function(String) onAcceptClicked) {
    String salonNote = '';
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
                        keyboardType: TextInputType.text,
                        onChanged: (note) {
                          salonNote = note;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 2),
                  child: ElevatedButton(
                    onPressed: () {
                      onAcceptClicked(salonNote);
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
