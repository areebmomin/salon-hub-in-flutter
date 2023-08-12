part of '../verify_business_page.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 21, top: 32),
      child: GestureDetector(
        onTap: () {
          context
              .read<SaloonRegistrationCubit>()
              .saloonRegistrationVerifyPageCloseButtonClicked();
        },
        child: const Icon(
          Icons.close,
          size: 40,
        ),
      ),
    );
  }
}