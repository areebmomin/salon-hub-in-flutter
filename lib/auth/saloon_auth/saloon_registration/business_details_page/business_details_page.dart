import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../../../utils/index.dart';
import '../cubit/saloon_registration_cubit.dart';

part 'widgets/address_text_field.dart';

part 'widgets/attendee_details_section.dart';

part 'widgets/business_details_heading.dart';

part 'widgets/business_location_text_field.dart';

part 'widgets/business_name_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/owner_details_section.dart';

part 'widgets/save_details_button.dart';

part 'widgets/saloon_photo_upload.dart';

part 'widgets/saloon_type_text_field.dart';

part 'widgets/service_days_text_field.dart';

part 'widgets/service_time_text_field.dart';

part 'widgets/services_text_field.dart';

part 'widgets/phone_number_text_field.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({super.key});

  @override
  State<BusinessDetailsPage> createState() =>
      _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SaloonRegistrationCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoOverscrollBehaviour(),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CloseButtonWidget(),
                  BusinessDetailsHeadingWidget(),
                  SaloonPhotoUploadWidget(),
                  BusinessNameTextFieldWidget(),
                  RegisterPhoneNumberTextFieldWidget(),
                  AddressTextFieldWidget(),
                  BusinessLocationTextFieldWidget(),
                  ServicesTextFieldWidget(),
                  SaloonTypeTextFieldWidget(),
                  ServiceDaysTextFieldWidget(),
                  ServiceTimeTextFieldWidget(),
                  OwnerDetailsWidget(),
                  AttendeeDetailsWidget(),
                  SaveDetailsButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
