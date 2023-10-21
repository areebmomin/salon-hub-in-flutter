import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:repository/user/book_page/book_page_repository.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:salon_hub/user/book_page/cubit/book_page_cubit.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';

part 'widgets/toolbar.dart';

part 'widgets/select_date.dart';

part 'widgets/select_time.dart';

part 'widgets/select_services.dart';

part 'widgets/add_note.dart';

part 'widgets/book_button.dart';

class BookPage extends StatelessWidget {
  final UserHomePageSalonInfo _salonInfo;

  const BookPage(this._salonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BookPageRepository>(
      create: (context) => FirebaseBookPageRepository(),
      child: BlocProvider(
        create: (context) =>
            BookPageCubit(
              RepositoryProvider.of<BookPageRepository>(context),
            ),
        child: BlocListener<BookPageCubit, BookPageState>(
          listener: (context, state) {

          },
          child: Scaffold(
            appBar: _appBar(context, _salonInfo),
            body: SafeArea(
              child: ScrollConfiguration(
                behavior: NoOverscrollBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16,
                                top: 24,
                                bottom: 24),
                            child: Text(
                              Strings.bookSlot,
                              style: TextStyleConstants.bookSlotHeading,
                            ),
                          ),
                          const SelectDate(),
                          const SelectTime(),
                          SelectServices(_salonInfo),
                          const AddNote(),
                          const BookButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
