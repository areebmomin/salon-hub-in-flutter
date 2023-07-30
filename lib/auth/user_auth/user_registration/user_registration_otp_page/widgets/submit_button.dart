part of '../user_registration_otp_page.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          context.read<UserRegistrationCubit>().onSubmitButtonClicked();
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
            if (state is UserRegistrationOtpLoading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return Text(
                Strings.submit.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: Strings.firaSans,
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
