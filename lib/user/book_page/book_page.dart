import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:repository/user/book_page/book_page_repository.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
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
  final UserProfile _userProfile;

  const BookPage(this._salonInfo, this._userProfile, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BookPageRepository>(
      create: (context) => FirebaseBookPageRepository(),
      child: BlocProvider(
        create: (context) => BookPageCubit(
          RepositoryProvider.of<BookPageRepository>(context),
          _salonInfo,
          _userProfile,
        ),
        child: BlocListener<BookPageCubit, BookPageState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: Scaffold(
            appBar: _appBar(context, _salonInfo),
            body: SafeArea(
              child: ScrollConfiguration(
                behavior: NoOverscrollBehaviour(),
                child: const SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16, top: 24, bottom: 24),
                            child: Text(
                              Strings.bookSlot,
                              style: TextStyleConstants.bookSlotHeading,
                            ),
                          ),
                          SelectDate(),
                          SelectTime(),
                          SelectServices(),
                          AddNote(),
                          BookButton(),
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
