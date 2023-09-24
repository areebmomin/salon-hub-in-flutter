part of '../verify_business_page.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<SaloonRegistrationCubit>();

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 21, top: 32),
      child: GestureDetector(
        onTap: () {
          cubit.verifyPageCloseButtonClicked();
        },
        child: const Icon(
          Icons.close,
          size: 40,
        ),
      ),
    );
  }
}