import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../../utils/index.dart';

part 'widgets/toolbar.dart';

part 'widgets/select_date.dart';

part 'widgets/select_time.dart';

part 'widgets/select_services.dart';

part 'widgets/add_note.dart';

part 'widgets/book_button.dart';

class BookPage extends StatelessWidget {
  final UserHomePageSalonInfo _userHomePageSalonInfo;
  const BookPage(this._userHomePageSalonInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, _userHomePageSalonInfo),
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
                      padding: EdgeInsets.only(left: 16, top: 24, bottom: 24),
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
    );
  }
}
