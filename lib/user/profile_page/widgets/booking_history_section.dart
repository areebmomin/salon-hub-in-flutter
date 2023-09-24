part of '../profile_page.dart';

class BookingHistorySection extends StatelessWidget {
  const BookingHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 24),
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
            itemCount: 5,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return BookingHistoryListItem(
                index: index,
                isLastItem: index == 4,
                isInitiallyExpanded: index == 0,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BookingHistoryListItem extends StatefulWidget {
  final int index;
  final bool isLastItem;
  final bool isInitiallyExpanded;

  const BookingHistoryListItem({
    super.key,
    required this.index,
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
      leading: Image.asset(Assets.profilePic, width: 40, height: 40),
      title: const Text(
        'Salon Name',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyleConstants.bookingHistorySalonHeading,
      ),
      tilePadding: const EdgeInsets.only(left: 12),
      subtitle: const Text(
        'Status',
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
                getTextListItem('Date', '12-04-23'),
                getTextListItem('Time', '12:04 - 04:25'),
                getTextListItem('Service', 'Hair Cut, Hair Color'),
                getTextListItem(
                    'Note', 'I may do Message also can you do that'),
                getTextListItem('Salon Response', 'Yes, definitely'),
              ],
            ),
          ),
        ),
      ],
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
