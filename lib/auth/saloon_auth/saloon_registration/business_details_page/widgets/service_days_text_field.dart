part of '../business_details_page.dart';

class ServiceDaysTextField extends StatefulWidget {
  const ServiceDaysTextField({super.key});

  @override
  State<ServiceDaysTextField> createState() => _ServiceDaysTextFieldState();
}

class _ServiceDaysTextFieldState extends State<ServiceDaysTextField> {
  @override
  Widget build(BuildContext context) {
    late var serviceDaysList =
        context.read<SaloonRegistrationCubit>().data.serviceDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.serviceDays,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: WeekdaySelector(
            onChanged: (int day) {
              setState(() {
                // Use module % 7 as Sunday's index in the array is 0 and
                // DateTime.sunday constant integer value is 7.
                final index = day % 7;
                // We "flip" the value in this example, but you may also
                // perform validation, a DB write, an HTTP call or anything
                // else before you actually flip the value,
                // it's up to your app's needs.
                serviceDaysList[index] = !serviceDaysList[index];
              });
            },
            values: serviceDaysList,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.inputText,
            ),
            selectedTextStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
