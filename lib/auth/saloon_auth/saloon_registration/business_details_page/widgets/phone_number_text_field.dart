part of '../business_details_page.dart';

class RegisterPhoneNumberTextField extends StatelessWidget {
  const RegisterPhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19, top: 20),
          child: RichText(
            text: const TextSpan(
              text: Strings.mobileNo,
              style: TextStyleConstants.textField,
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyleConstants.asterisk,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 19, top: 9),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              cubit.data.phoneNumber = number.phoneNumber ?? '';
            },
            onInputValidated: (isValid) {
              cubit.isPhoneNumberValid = isValid;
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              leadingPadding: 20,
              setSelectorButtonAsPrefixIcon: true,
            ),
            initialValue: PhoneNumber(isoCode: 'IN'),
            textStyle: TextStyleConstants.textField,
            selectorTextStyle: TextStyleConstants.textField,
            inputDecoration: const InputDecoration(
              enabledBorder: TextFieldConstants.transparentInputBorder,
              focusedBorder: TextFieldConstants.transparentInputBorder,
              border: TextFieldConstants.transparentInputBorder,
              hintText: Strings.hintPhoneNumber,
              suffixIcon: Icon(Icons.phone),
              hintStyle: TextStyleConstants.textFieldHint,
            ),
            keyboardAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
