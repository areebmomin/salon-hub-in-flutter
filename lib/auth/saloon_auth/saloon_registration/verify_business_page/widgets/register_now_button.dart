part of '../verify_business_page.dart';

class RegisterNowButton extends StatelessWidget {
  const RegisterNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          context.read<SaloonRegistrationCubit>().registerNowButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: BlocBuilder<SaloonRegistrationCubit, SaloonRegistrationState>(
          builder: (context, state) {
            if(state is SaloonRegistrationLoading) {
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
