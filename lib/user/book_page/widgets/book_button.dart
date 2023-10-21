part of '../book_page.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<BookPageCubit>();

    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
        top: 32,
        bottom: 32,
      ),
      child: ElevatedButton(
        onPressed: () {
          cubit.bookButtonClicked();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: BlocBuilder<BookPageCubit, BookPageState>(
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator(color: Colors.white);
            } else {
              return const Text(
                Strings.book,
                style: TextStyleConstants.button,
              );
            }
          },
        ),
      ),
    );
  }
}
