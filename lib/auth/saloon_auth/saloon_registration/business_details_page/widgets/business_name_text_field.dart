part of '../business_details_page.dart';

class BusinessNameTextField extends StatelessWidget {
  const BusinessNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.businessName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.headingTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
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
              hintText: Strings.businessNameHint,
              hintStyle: TextStyleConstants.textFieldHintStyle,
              suffixIcon: Icon(Icons.business),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyleConstants.textFieldTextStyle,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onChanged: (name) {
              cubit.data.businessName = name.trim();
            },
          ),
        ),
      ],
    );
  }
}
