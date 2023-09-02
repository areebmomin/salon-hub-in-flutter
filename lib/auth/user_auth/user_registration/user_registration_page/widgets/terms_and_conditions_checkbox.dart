part of '../user_registration_page.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserRegistrationCubit>();

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: Row(
        children: [
          BlocBuilder<UserRegistrationCubit, UserRegistrationState>(
            buildWhen: (previousState, state) {
              return state is TermsAndCondition;
            },
            builder: (context, state) {
              return Checkbox(
                value: cubit.data.isTermsAndConditionAccepted,
                onChanged: (value) {
                  cubit.isTermsAndConditionAccepted = value ?? false;
                },
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(_getColor),
              );
            },
          ),
          const Text(
            Strings.agreeTermsAndConditions,
            style: TextStyleConstants.textField,
          ),
        ],
      ),
    );
  }

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.checkboxActive;
    }
    return Colors.red;
  }
}
