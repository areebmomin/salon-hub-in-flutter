part of '../business_details_page.dart';

class ServicesTextFieldWidget extends StatefulWidget {
  const ServicesTextFieldWidget({super.key});

  @override
  State<ServicesTextFieldWidget> createState() =>
      _ServicesTextFieldWidgetState();
}

class _ServicesTextFieldWidgetState extends State<ServicesTextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SaloonRegistrationCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.services,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.headingTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
              ],
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
              hintText: Strings.enterCommaSeparatedServices,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.home_repair_service),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
            keyboardType: TextInputType.streetAddress,
            onChanged: (service) {
              if (service.contains(',')) {
                cubit.addService(service);
                _controller.clear();
              }
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 4),
          child: BlocBuilder<SaloonRegistrationCubit, SaloonRegistrationState>(
            buildWhen: (previousState, state) {
              return state is SaloonRegistrationServicesUpdated;
            },
            builder: (context, state) {
              return Wrap(
                spacing: 8.0,
                children: cubit.data.services.map((chip) {
                  return Chip(
                    label: Text(chip),
                    onDeleted: () {
                      cubit.removeService(chip);
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
