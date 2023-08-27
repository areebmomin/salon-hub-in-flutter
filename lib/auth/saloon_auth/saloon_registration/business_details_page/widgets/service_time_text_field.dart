part of '../business_details_page.dart';

class ServiceTimeTextField extends StatefulWidget {
  const ServiceTimeTextField({super.key});

  @override
  State<ServiceTimeTextField> createState() => _ServiceTimeTextFieldState();
}

class _ServiceTimeTextFieldState extends State<ServiceTimeTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var serviceTime =
        context.read<SaloonRegistrationCubit>().data.serviceTime;

    _updateTextFieldText(serviceTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.serviceTime,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              suffixIcon: Icon(Icons.schedule),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () async {
              TimeRange? result = await _openTimeRangePicker(serviceTime);
              if (result != null) {
                // get start and end time data
                serviceTime.startTime = result.startTime.toTime();
                serviceTime.endTime = result.endTime.toTime();

                // set data in text field
                _updateTextFieldText(serviceTime);
              }
            },
          ),
        ),
      ],
    );
  }

  Future<TimeRange?> _openTimeRangePicker(ServiceTime serviceTime) async {
    return await showTimeRangePicker(
      context: context,
      start: _timeToTimeOfDay(serviceTime.startTime),
      end: _timeToTimeOfDay(serviceTime.endTime),
      interval: const Duration(minutes: 30),
      use24HourFormat: false,
      disabledTime: TimeRange(
        startTime: const TimeOfDay(hour: 22, minute: 0),
        endTime: const TimeOfDay(hour: 6, minute: 0),
      ),
      disabledColor: Colors.white,
      strokeWidth: 8,
      strokeColor: Colors.green.shade500.withOpacity(0.8),
      ticks: 8,
      ticksLength: 32,
      ticksColor: Colors.grey,
      labels: Strings.clockHours.asMap().entries.map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: 36,
      rotateLabels: false,
      padding: 64,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.grey.shade700,
      ),
      timeTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
      ),
      activeTimeTextStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Colors.white,
      ),
      fromText: Strings.open,
      toText: Strings.close,
      handlerColor: Colors.green.shade600,
      selectedColor: Colors.green.shade400,
    );
  }

  void _updateTextFieldText(ServiceTime serviceTime) {
    _controller.text =
        '${serviceTime.startTime.toString()} - ${serviceTime.endTime.toString()}';
  }

  TimeOfDay _timeToTimeOfDay(Time time) =>
      TimeOfDay(hour: time.hour, minute: time.minute);
}

extension on TimeOfDay {
  Time toTime() {
    return Time(
      hour: hour,
      minute: minute,
    );
  }
}
