part of '../edit_profile_page.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserEditProfilePageCubit>();

    if (cubit.state is LoadProfileData) {
      _controller.text = cubit.userProfile.email;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.email,
            style: TextStyleConstants.textField,
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
              hintText: Strings.hintEmail,
              hintStyle: TextStyleConstants.textFieldHint,
              suffixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            style: TextStyleConstants.textField,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) {
              cubit.userProfile.email = email.trim();
            },
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
