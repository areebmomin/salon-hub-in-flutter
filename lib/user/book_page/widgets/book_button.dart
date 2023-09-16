part of '../book_page.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
        top: 32,
        bottom: 32,
      ),
      child: ElevatedButton(
        onPressed: () {
          //cubit.loginButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        // child: BlocBuilder<UserLoginCubit, UserLoginState>(
        //   builder: (context, state) {
        //     if (state is Loading) {
        //       return const CircularProgressIndicator(color: Colors.white);
        //     } else {
        //       return Text(
        //         cubit.isOtpSent ? Strings.verifyOtp : Strings.getOtp,
        //         style: TextStyleConstants.button,
        //       );
        //     }
        //   },
        // ),
        child: const Text(
          Strings.book,
          style: TextStyleConstants.button,
        ),
      ),
    );
  }
}
