import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';

part 'widgets/toolbar.dart';

part 'widgets/salon_overview.dart';

part 'widgets/basics_card.dart';

part 'widgets/availability_card.dart';

part 'widgets/location_card.dart';

part 'widgets/owner_details_list.dart';

part 'widgets/attendee_details_list.dart';

class AboutSaloonPage extends StatelessWidget {
  const AboutSaloonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
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
