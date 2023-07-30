import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../saloon/saloon_home_page.dart';
import '../../../utils/index.dart';

part 'widgets/address_text_field.dart';

part 'widgets/attendee_details_section.dart';

part 'widgets/business_details_heading.dart';

part 'widgets/business_location_text_field.dart';

part 'widgets/business_name_text_field.dart';

part 'widgets/close_button.dart';

part 'widgets/owner_details_section.dart';

part 'widgets/register_now_button.dart';

part 'widgets/saloon_photo_upload.dart';

part 'widgets/saloon_type_text_field.dart';

part 'widgets/service_days_text_field.dart';

part 'widgets/service_time_text_field.dart';

part 'widgets/services_text_field.dart';

class SaloonRegistrationWidget extends StatefulWidget {
  const SaloonRegistrationWidget({super.key});

  @override
  State<SaloonRegistrationWidget> createState() =>
      _SaloonRegistrationWidgetState();
}

class _SaloonRegistrationWidgetState extends State<SaloonRegistrationWidget> {
  bool _isBusinessNameValid = false;
  bool _isAddressValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AddressTextFieldWidget(_onAddressValidated),
                const BusinessLocationTextFieldWidget(),
                const ServicesTextFieldWidget(),
                const SaloonTypeTextFieldWidget(),
                const ServiceDaysTextFieldWidget(),
                const ServiceTimeTextFieldWidget(),
                const OwnerDetailsWidget(),
                const AttendeeDetailsWidget(),
                RegisterNowButtonWidget(_onRegisterButtonCLicked),
              ],
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
