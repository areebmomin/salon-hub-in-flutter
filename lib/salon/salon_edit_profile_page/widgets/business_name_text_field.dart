part of '../salon_edit_profile_page.dart';

class BusinessNameTextField extends StatelessWidget {
  BusinessNameTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<SalonEditProfilePageBloc>();
    _controller.text = bloc.salonInfo.salonName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.businessName,
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
            controller: _controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.businessNameHint,
              hintStyle: TextStyleConstants.textFieldHint,
              suffixIcon: Icon(Icons.business),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            style: TextStyleConstants.textField,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onChanged: (name) {
              bloc.salonInfo.salonName = name.trim();
            },
          ),
        ),
      ],
    );
  }
}
