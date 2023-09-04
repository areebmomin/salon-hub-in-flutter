part of '../user_home_page.dart';

getFilterFloatingButton(BuildContext context) => FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return const FilterBottomSheet();
          },
        );
      },
      backgroundColor: AppColors.primaryButtonBackground,
      child: const Icon(Icons.filter_list_alt),
    );
