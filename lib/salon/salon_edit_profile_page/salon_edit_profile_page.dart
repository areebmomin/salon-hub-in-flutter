import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:repository/salon/salon_edit_profile_page/salon_edit_profile_page_repository.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';
import 'cubit/salon_edit_profile_page_cubit.dart';

part 'widgets/address_text_field.dart';

part 'widgets/attendee_details_section.dart';

part 'widgets/business_details_heading.dart';

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
  final EditProfilePageSalonInfo _salonInfo;

  const SalonEditProfilePage(this._salonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SalonEditProfilePageRepository>(
      create: (context) => FirebaseSalonEditProfilePageRepository(),
      child: BlocProvider(
        create: (context) => SalonEditProfilePageCubit(
          RepositoryProvider.of<SalonEditProfilePageRepository>(context),
          _salonInfo,
        ),
        child:
            BlocListener<SalonEditProfilePageCubit, SalonEditProfilePageState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
              );
            }  else if (state is ProfileDataUpdateSuccess) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ScrollConfiguration(
                behavior: NoOverscrollBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CloseButton(),
                      const BusinessDetailsHeading(),
                      const SalonPhotoUpload(),
                      BusinessNameTextField(),
                      const RegisterPhoneNumberTextField(),
                      AddressTextField(),
                      const ServicesTextField(),
                      const SalonTypeTextField(),
                      const ServiceDaysTextField(),
                      const ServiceTimeTextField(),
                      const OwnerDetails(),
                      const AttendeeDetails(),
                      const SaveDetailsButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
