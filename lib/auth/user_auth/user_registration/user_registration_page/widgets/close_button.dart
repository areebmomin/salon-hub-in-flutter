part of '../user_registration_page.dart';

class CloseButtonWidget extends StatelessWidget {
  final Function() onCloseButtonClicked;

  const CloseButtonWidget({super.key, required this.onCloseButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 21, top: 32),
      child: GestureDetector(
        onTap: onCloseButtonClicked,
        child: const Icon(
          Icons.close,
          size: 40,
        ),
      ),
    );
  }
}
