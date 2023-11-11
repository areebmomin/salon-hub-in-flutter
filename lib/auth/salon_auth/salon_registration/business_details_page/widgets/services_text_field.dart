part of '../business_details_page.dart';

class ServicesTextField extends StatefulWidget {
  const ServicesTextField({super.key});

  @override
  State<ServicesTextField> createState() => _ServicesTextFieldState();
}

class _ServicesTextFieldState extends State<ServicesTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var bloc = context.read<SalonRegistrationBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.services,
              style: TextStyleConstants.textField,
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyleConstants.asterisk,
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
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.enterCommaSeparatedServices,
              hintStyle: TextStyleConstants.textFieldHint,
              suffixIcon: Icon(Icons.home_repair_service),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            style: TextStyleConstants.textField,
            keyboardType: TextInputType.streetAddress,
            onChanged: (service) {
              if (service.contains(',')) {
                bloc.add(AddService(service));
                _controller.clear();
              }
            },
            textInputAction: TextInputAction.next,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 4),
          child: BlocBuilder<SalonRegistrationBloc, SalonRegistrationState>(
            buildWhen: (previousState, state) {
              return state is ServicesUpdated;
            },
            builder: (context, state) {
              return Wrap(
                spacing: 8.0,
                children: bloc.data.services.map((service) {
                  return Chip(
                    label: Text(service),
                    onDeleted: () {
                      bloc.add(RemoveService(service));
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
