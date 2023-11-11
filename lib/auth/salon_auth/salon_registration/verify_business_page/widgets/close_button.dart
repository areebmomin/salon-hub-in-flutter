part of '../verify_business_page.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<SalonRegistrationBloc>();

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 21, top: 32),
      child: GestureDetector(
        onTap: () {
          bloc.add(const VerifyPageCloseButtonClickedEvent());
        },
        child: const Icon(Icons.close, size: 40),
      ),
    );
  }
}
