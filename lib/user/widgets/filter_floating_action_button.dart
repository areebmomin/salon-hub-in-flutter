part of '../user_home_page.dart';

getFilterFloatingButton(BuildContext context) => FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              color: Colors.transparent,
              child: DraggableScrollableSheet(
                initialChildSize: 0.70,
                minChildSize: 0.40,
                maxChildSize: 1,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.white,
                    child: ScrollConfiguration(
                      behavior: NoOverscrollBehaviour(),
                      child: ListView(
                        controller: scrollController,
                        children: const [
                          FilterBottomSheet()
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      backgroundColor: AppColors.primaryButtonBackground,
      child: const Icon(Icons.filter_list_alt),
    );
