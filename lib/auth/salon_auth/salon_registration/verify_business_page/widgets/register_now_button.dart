part of '../verify_business_page.dart';

class RegisterNowButton extends StatelessWidget {
  const RegisterNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SalonRegistrationCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          cubit.registerNowButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: BlocBuilder<SalonRegistrationCubit, SalonRegistrationState>(
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.registerNowUpperCase,
                style: TextStyleConstants.button,
              );
            }
          },
        ),
      ),
    );
  }
}
