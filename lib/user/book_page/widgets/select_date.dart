part of '../book_page.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  final String restorationId = 'book';

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  static final DateTime now = DateTime.now();
  static final DateTime endOfWeek =
      now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
  final RestorableDateTime _selectedDate = RestorableDateTime(now);
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: now,
          lastDate: endOfWeek,
          confirmText: Strings.selectUpperCase,
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          const Text(
            Strings.date,
            style: TextStyleConstants.bookSlotSubHeading,
          ),
          Expanded(
            child: Center(
              child: OutlinedButton(
                onPressed: () {
                  _restorableDatePickerRouteFuture.present();
                },
                child: Text(DateFormat('dd MMM yyyy')
                    .format(_selectedDate.value.toLocal())),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
