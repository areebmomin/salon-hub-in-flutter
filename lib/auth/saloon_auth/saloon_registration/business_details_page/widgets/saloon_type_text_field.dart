part of '../business_details_page.dart';

class SaloonTypeTextFieldWidget extends StatefulWidget {
  const SaloonTypeTextFieldWidget({super.key});

  @override
  State<SaloonTypeTextFieldWidget> createState() =>
      _SaloonTypeTextFieldWidgetState();
}

class _SaloonTypeTextFieldWidgetState extends State<SaloonTypeTextFieldWidget> {
  String? selectedValue = Strings.saloonTypes.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.type,
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
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              hintText: Strings.businessAddressHint,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: DropdownButtonFormField(
                value: selectedValue,
                onChanged: (newValue) {
                  context.read<SaloonRegistrationCubit>().data.type = newValue ?? '';
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: Strings.saloonTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.headingTextColor,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
