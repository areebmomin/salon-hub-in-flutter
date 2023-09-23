import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';

part 'widgets/salon_overview.dart';

part 'widgets/basics_card.dart';

part 'widgets/availability_card.dart';

part 'widgets/location_card.dart';

part 'widgets/owner_details_list.dart';

part 'widgets/attendee_details_list.dart';

class SalonProfilePage extends StatelessWidget {
  const SalonProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SalonOverview(),
                Dividers.lightDivider,
                BasicsCard(),
                AvailabilityCard(),
                Dividers.lightDivider,
                LocationCard(),
                Dividers.lightDivider,
                OwnerDetailsList(),
                AttendeeDetailsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var _appBar = AppBar(
  title: const Text(Strings.profile),
  backgroundColor: Colors.white,
  titleTextStyle: const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: AppColors.headingTextColor,
  ),
  elevation: 3,
  shadowColor: Colors.grey.shade200,
  iconTheme: const IconThemeData(
    color: AppColors.headingTextColor,
  ),
);
