part of '../user_registration_page.dart';

class RegisterNowButtonWidget extends StatelessWidget {
  const RegisterNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          context.read<UserRegistrationCubit>().onRegisterButtonCLicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: BlocBuilder<UserRegistrationCubit, UserRegistrationState>(
          buildWhen: (previousState, state) {
            return state is UserRegistrationLoading ||
                state is UserRegistrationShowToast ||
                state is UserRegistrationOpenOtpPage;
          },
          builder: (context, state) {
            if (state is UserRegistrationLoading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.registerNowUpperCase,
                style: TextStyle(
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
