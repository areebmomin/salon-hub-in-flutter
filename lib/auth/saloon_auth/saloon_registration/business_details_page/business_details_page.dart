import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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

class BusinessDetailsPageWidget extends StatefulWidget {
  const BusinessDetailsPageWidget({super.key});

  @override
  State<BusinessDetailsPageWidget> createState() =>
      _BusinessDetailsPageWidgetState();
}

class _BusinessDetailsPageWidgetState extends State<BusinessDetailsPageWidget> {
  bool _isBusinessNameValid = false;
  bool _isAddressValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SaloonRegistrationCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: NoOverscrollBehaviour(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CloseButtonWidget(),
                  const BusinessDetailsHeadingWidget(),
                  const SaloonPhotoUploadWidget(),
                  BusinessNameTextFieldWidget(_onBusinessNameValidated),
                  const RegisterPhoneNumberTextFieldWidget(),
                  AddressTextFieldWidget(_onAddressValidated),
                  const BusinessLocationTextFieldWidget(),
                  const ServicesTextFieldWidget(),
                  const SaloonTypeTextFieldWidget(),
                  const ServiceDaysTextFieldWidget(),
                  const ServiceTimeTextFieldWidget(),
                  const OwnerDetailsWidget(),
                  const AttendeeDetailsWidget(),
                  SaveDetailsButtonWidget(_onRegisterButtonCLicked),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onBusinessNameValidated(bool isValid) {
    _isBusinessNameValid = isValid;
  }

  void _onAddressValidated(bool isValid) {
    _isAddressValid = isValid;
  }

  void _onRegisterButtonCLicked() {
    if (!_isBusinessNameValid) {
      Fluttertoast.showToast(
          msg: Strings.enterBusinessName, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    if (!_isAddressValid) {
      Fluttertoast.showToast(
          msg: Strings.enterAddress, toastLength: Toast.LENGTH_SHORT);
      return;
    }

    // Navigate to Home page
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.saloonHomePage, (route) => false);
  }
}
