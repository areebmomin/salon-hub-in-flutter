import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
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

class AboutSalonPage extends StatelessWidget {
  final UserHomePageSalonInfo _salonInfo;

  const AboutSalonPage(this._salonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SalonOverview(_salonInfo),
                Dividers.lightDivider,
                BasicsCard(_salonInfo),
                AvailabilityCard(_salonInfo),
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
