part of '../salon_edit_profile_page.dart';

class SalonTypeTextField extends StatefulWidget {
  const SalonTypeTextField({super.key});

  @override
  State<SalonTypeTextField> createState() => _SalonTypeTextFieldState();
}

class _SalonTypeTextFieldState extends State<SalonTypeTextField> {
  late var bloc = context.read<SalonEditProfilePageBloc>();

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
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              suffixIcon: DropdownButtonFormField(
                value: bloc.salonInfo.type,
                onChanged: (newValue) {
                  setState(() {
                    bloc.salonInfo.type = newValue ?? '';
                  });
                },
                items: Strings.salonTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: TextStyleConstants.textField,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
