part of '../user_login_page.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          context.read<UserLoginCubit>().loginButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: BlocBuilder<UserLoginCubit, UserLoginState>(
          buildWhen: (previousState, state) {
            return state is UserLoginOtpSent;
          },
          builder: (context, state) {
            return Text(
              context.read<UserLoginCubit>().isOtpSent
                  ? Strings.verifyOtp
                  : Strings.getOtp,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: Strings.firaSans,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
