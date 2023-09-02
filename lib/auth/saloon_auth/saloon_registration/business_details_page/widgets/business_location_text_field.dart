part of '../business_details_page.dart';

class BusinessLocationTextField extends StatelessWidget {
  const BusinessLocationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.businessLocation,
            style: TextStyleConstants.textFieldTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.businessAddressHint,
              hintStyle: TextStyleConstants.textFieldHintStyle,
              suffixIcon: Icon(Icons.add_location_alt),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyleConstants.textFieldTextStyle,
            keyboardType: TextInputType.streetAddress,
            onChanged: (location) {
              cubit.data.location = location.trim();
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
