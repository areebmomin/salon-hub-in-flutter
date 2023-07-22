part of '../user_login_page.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function() onCLicked;

  const LoginButtonWidget(this.onCLicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {
          onCLicked();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: const Text(
          Strings.loginButton,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.firaSans,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
