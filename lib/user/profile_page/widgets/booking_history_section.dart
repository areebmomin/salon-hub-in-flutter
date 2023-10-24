part of '../profile_page.dart';

class BookingHistorySection extends StatelessWidget {
  const BookingHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserProfilePageCubit>();

    return BlocBuilder<UserProfilePageCubit, UserProfilePageState>(
      buildWhen: (previousState, state) {
        return state is LoadBookingHistory;
      },
      builder: (context, state) {
        if (state is LoadBookingHistory) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  Strings.bookingHistory,
                  style: TextStyleConstants.bookingHistoryHeading,
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  itemCount: state.bookingHistoryList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BookingHistoryListItem(
                      bookingHistory: state.bookingHistoryList[index],
                      isLastItem: index == state.bookingHistoryList.length - 1,
                      isInitiallyExpanded: index == 0,
                    );
                  },
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
}

class BookingHistoryListItem extends StatefulWidget {
  final BookingHistory bookingHistory;
  final bool isLastItem;
  final bool isInitiallyExpanded;

  const BookingHistoryListItem({
    super.key,
    required this.bookingHistory,
    required this.isLastItem,
    required this.isInitiallyExpanded,
  });

  @override
  State<BookingHistoryListItem> createState() => _BookingHistoryListItemState();
}

class _BookingHistoryListItemState extends State<BookingHistoryListItem> {
  var _isExpanded = false;

  @override
  initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading:
          _getProfileImageOrIcon(widget.bookingHistory.salonProfilePictureUrl),
      title: Text(
        widget.bookingHistory.salonName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyleConstants.bookingHistorySalonHeading,
      ),
      tilePadding: const EdgeInsets.only(left: 12),
      subtitle: Text(
        widget.bookingHistory.bookingStatus.name,
        style: TextStyleConstants.bookingHistoryStatus,
      ),
      maintainState: true,
      initiallyExpanded: widget.isInitiallyExpanded,
      backgroundColor: AppColors.headingBackground,
      collapsedBackgroundColor: AppColors.headingBackground,
      trailing: getExpandedTrailingWidget(_isExpanded),
      shape: const Border(),
      collapsedShape: Border(
        bottom: BorderSide(
          color: widget.isLastItem
              ? Colors.transparent
              : AppColors.inputFieldBackground,
          width: 2,
        ),
      ),
      onExpansionChanged: (isExpanded) {
        setState(() {
          _isExpanded = isExpanded;
        });
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: const BoxDecoration(
              color: AppColors.inputFieldBackground,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                getTextListItem(
                    Strings.date,
                    DateFormat('dd-MM-yyyy')
                        .format(widget.bookingHistory.date)),
                getTextListItem(Strings.time,
                    '${widget.bookingHistory.serviceTime.startTime.toString()} - ${widget.bookingHistory.serviceTime.endTime.toString()}'),
                getTextListItem(Strings.services,
                    widget.bookingHistory.services.join(', ')),
                getTextListItem(Strings.note, widget.bookingHistory.userNote),
                getTextListItem(
                    Strings.salonResponse, widget.bookingHistory.salonNote),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProfileImageOrIcon(String url) {
    var image = url.isNotEmpty
        ? FadeInImage.assetNetwork(
            placeholder: Assets.profilePic,
            image: url,
            fit: BoxFit.fill,
            height: 40,
            width: 40,
          )
        : Image.asset(
            Assets.profilePic,
            fit: BoxFit.fill,
            height: 40,
            width: 40,
          );

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: image,
      ),
    );
  }

  bool getIsExpanded(bool isInitiallyExpanded) {
    _isExpanded = isInitiallyExpanded;
    return _isExpanded;
  }

  Widget getExpandedTrailingWidget(bool isExpanded) {
    var iconColor = isExpanded ? Colors.white : AppColors.lightTextColor;
    var backgroundColor = isExpanded
        ? AppColors.headingTextColor
        : AppColors.inputFieldBackground;
    var icon = isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }

  Widget getTextListItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4, top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyleConstants.bookingHistoryListTitle,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyleConstants.bookingHistoryListValue,
            ),
          ),
        ],
      ),
    );
  }
}
