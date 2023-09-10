part of '../profile_page.dart';

class BookingHistorySection extends StatelessWidget {
  const BookingHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
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
              return const BookingHistoryListItem();
            },
          ),
        ],
      ),
    );
  }
}

class BookingHistoryListItem extends StatefulWidget {
  const BookingHistoryListItem({super.key});

  @override
  State<BookingHistoryListItem> createState() => _BookingHistoryListItemState();
}

class _BookingHistoryListItemState extends State<BookingHistoryListItem> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

