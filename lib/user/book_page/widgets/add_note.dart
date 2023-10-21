part of '../book_page.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<BookPageCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            Strings.note,
            style: TextStyleConstants.bookSlotSubHeading,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: TextField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.inputFieldBackground,
                  border: TextFieldConstants.curvedUnderlineInputBorder,
                  enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
                  focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                ),
                style: TextStyleConstants.textField,
                keyboardType: TextInputType.text,
                maxLines: 3,
                onChanged: (note) {
                  cubit.bookSlot.note = note.trim();
                },
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
