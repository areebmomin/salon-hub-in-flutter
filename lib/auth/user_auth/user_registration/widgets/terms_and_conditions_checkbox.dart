part of '../user_registration_page.dart';

class TermsAndConditionCheckboxWidget extends StatefulWidget {
  final Function(bool isValid) onInputValidated;

  const TermsAndConditionCheckboxWidget(this.onInputValidated, {super.key});

  @override
  State<TermsAndConditionCheckboxWidget> createState() =>
      _TermsAndConditionCheckboxWidgetState();
}

class _TermsAndConditionCheckboxWidgetState
    extends State<TermsAndConditionCheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
              widget.onInputValidated(value ?? false);
            },
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
          ),
          const Text(
            Strings.agreeTermsAndConditions,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.checkboxActive;
    }
    return Colors.red;
  }
}
