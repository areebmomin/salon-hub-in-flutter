import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:repository/salon_registration/models/salon_registration_data.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';

part 'widgets/address_text_field.dart';

part 'widgets/attendee_details_section.dart';

part 'widgets/business_details_heading.dart';

part 'widgets/business_location_text_field.dart';

part 'widgets/business_name_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/owner_details_section.dart';

part 'widgets/save_details_button.dart';

part 'widgets/salon_photo_upload.dart';

part 'widgets/salon_type_text_field.dart';

part 'widgets/service_days_text_field.dart';

part 'widgets/service_time_text_field.dart';

part 'widgets/services_text_field.dart';

part 'widgets/phone_number_text_field.dart';

class SalonEditProfilePage extends StatelessWidget {
  const SalonEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CloseButton(),
                BusinessDetailsHeading(),
                SaloonPhotoUpload(),
                BusinessNameTextField(),
                RegisterPhoneNumberTextField(),
                AddressTextField(),
                BusinessLocationTextField(),
                ServicesTextField(),
                SaloonTypeTextField(),
                ServiceDaysTextField(),
                ServiceTimeTextField(),
                OwnerDetails(),
                AttendeeDetails(),
                SaveDetailsButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
