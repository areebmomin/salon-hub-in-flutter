part of '../schedule_tab_view.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
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
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: '8149311487 ',
                                      style: TextStyleConstants
                                          .phoneNumberScheduleCard,
                                    ),
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          _launchUrl('8149311487');
                                        },
                                        child: const Icon(
                                          Icons.phone,
                                          size: 16,
                                          color: AppColors.inputText,
                                        ),
                                      ),
                                    ),
                                  ],
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
                        {}
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
      },
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
}

enum ScheduleOption { notes }
