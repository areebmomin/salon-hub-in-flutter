part of '../about_saloon_page.dart';

class BasicsCard extends StatelessWidget {
  const BasicsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
            const Text(Strings.basics, style: TextStyleConstants.salonInfoCardHeading),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text(Strings.type, style: TextStyleConstants.bookSlotSubHeading),
                Expanded(
                  child: Text(
                    'Male/Female',
                    style: TextStyleConstants.bookingHistoryListValue,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(Strings.services,
                    style: TextStyleConstants.bookSlotSubHeading),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 4,
                    alignment: WrapAlignment.end,
                    children: <Widget>[
                      _buildChip('Gamer'),
                      _buildChip('Hacker'),
                      _buildChip('Develop'),
                      _buildChip('Racer'),
                      _buildChip('Traveller'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      elevation: 1,
      label: Text(label),
      labelStyle: TextStyleConstants.serviceChipSelected,
      backgroundColor: AppColors.primaryButtonBackground,
      shadowColor: Colors.grey[60],
    );
  }
}
