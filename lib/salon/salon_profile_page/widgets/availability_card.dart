part of '../salon_profile_page.dart';

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  static const serviceDaysList = [false, true, true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 30,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(Strings.availability,
                style: TextStyleConstants.salonInfoCardHeading),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(Strings.time,
                    style: TextStyleConstants.bookSlotSubHeading),
                Expanded(
                  child: Text(
                    '12:04 AM - 02:30 PM',
                    style: TextStyleConstants.bookingHistoryListValue,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(Strings.days,
                style: TextStyleConstants.bookSlotSubHeading),
            const SizedBox(height: 4),
            WeekdaySelector(
              onChanged: (int day) {},
              values: serviceDaysList,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.inputText,
              ),
              selectedTextStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
