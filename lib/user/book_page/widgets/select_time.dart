part of '../book_page.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  @override
  void initState() {
    super.initState();
    setEndTimeHalfAnHourFromNow();
  }

  void setEndTimeHalfAnHourFromNow() {
    final now = TimeOfDay.now();
    const minutesToAdd = 30;

    startTime = now;

    endTime = TimeOfDay(
      hour: now.hour + (now.minute + minutesToAdd) ~/ 60,
      minute: (now.minute + minutesToAdd) % 60,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<BookPageCubit>();
    cubit.bookSlot.startTime = startTime;
    cubit.bookSlot.endTime = endTime;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        children: [
          const Text(
            Strings.time,
            style: TextStyleConstants.bookSlotSubHeading,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: startTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          child: Directionality(
                            textDirection: defaultTextDirection,
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: false,
                              ),
                              child: child!,
                            ),
                          ),
                        );
                      },
                    );
                    if (time != null) {
                      setState(() {
                        startTime = time;
                      });
                    }
                  },
                  child: Text(startTime.format(context)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    Strings.colon,
                    style: TextStyleConstants.timeColon,
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    final TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: endTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                          ),
                          child: Directionality(
                            textDirection: defaultTextDirection,
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: false,
                              ),
                              child: child!,
                            ),
                          ),
                        );
                      },
                    );
                    if (time != null) {
                      setState(() {
                        endTime = time;
                      });
                    }
                  },
                  child: Text(endTime.format(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
