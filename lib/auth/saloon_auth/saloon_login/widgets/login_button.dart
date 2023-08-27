part of '../salon_login_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SaloonLoginCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          cubit.loginButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: BlocBuilder<SaloonLoginCubit, SaloonLoginState>(
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.loginButton,
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
