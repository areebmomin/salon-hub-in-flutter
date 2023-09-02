part of '../user_registration_otp_page.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserRegistrationCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          cubit.onSubmitButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: BlocBuilder<UserRegistrationCubit, UserRegistrationState>(
          builder: (context, state) {
            if (state is OtpLoading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.submitUpperCase,
                style: TextStyleConstants.buttonTextStyle,
              );
            }
          },
        ),
      ),
    );
  }
}
