import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utils/index.dart';
import '../../index.dart';

class UserRegistrationWidget extends StatefulWidget {
  const UserRegistrationWidget({super.key});

  @override
  State<UserRegistrationWidget> createState() => _UserRegistrationWidgetState();
}

class _UserRegistrationWidgetState extends State<UserRegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                CloseButtonWidget(),
                RegisterNowWidget(),
                NameTextFieldWidget(),
                RegisterPhoneNumberTextFieldWidget(),
                EmailTextFieldWidget(),
                AddressTextFieldWidget(),
                TermsAndConditionCheckboxWidget(),
                RegisterNowButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 21, top: 32),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          size: 40,
        ),
      ),
    );
  }
}

class RegisterNowWidget extends StatelessWidget {
  const RegisterNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 21, left: 18),
      child: Text(
        Strings.registerNow,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.headingTextColor,
          fontFamily: Strings.firaSans,
        ),
      ),
    );
  }
}

class NameTextFieldWidget extends StatefulWidget {
  const NameTextFieldWidget({super.key});

  @override
  State<NameTextFieldWidget> createState() => _NameTextFieldWidgetState();
}

class _NameTextFieldWidgetState extends State<NameTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.fullName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: InputBorder.none,
              hintText: Strings.hintName,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.person),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}

class RegisterPhoneNumberTextFieldWidget extends StatefulWidget {
  const RegisterPhoneNumberTextFieldWidget({super.key});

  @override
  State<RegisterPhoneNumberTextFieldWidget> createState() =>
      _RegisterPhoneNumberTextFieldWidgetState();
}

class _RegisterPhoneNumberTextFieldWidgetState
    extends State<RegisterPhoneNumberTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19, top: 20),
          child: Text(
            Strings.mobileNo,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 19, top: 9),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print("object");
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              leadingPadding: 20,
              setSelectorButtonAsPrefixIcon: true,
            ),
            textStyle: const TextStyle(
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            selectorTextStyle: const TextStyle(
              color: AppColors.inputText,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            inputDecoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: Strings.hintPhoneNumber,
              suffixIcon: Icon(Icons.phone),
              hintStyle: TextStyle(
                color: AppColors.inputText,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmailTextFieldWidget extends StatefulWidget {
  const EmailTextFieldWidget({super.key});

  @override
  State<EmailTextFieldWidget> createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.email,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: InputBorder.none,
              hintText: Strings.hintEmail,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.email),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}

class AddressTextFieldWidget extends StatefulWidget {
  const AddressTextFieldWidget({super.key});

  @override
  State<AddressTextFieldWidget> createState() => _AddressTextFieldWidgetState();
}

class _AddressTextFieldWidgetState extends State<AddressTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.address,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: InputBorder.none,
              hintText: Strings.hintAddress,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.location_on),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.streetAddress,
          ),
        ),
      ],
    );
  }
}

class TermsAndConditionCheckboxWidget extends StatefulWidget {
  const TermsAndConditionCheckboxWidget({super.key});

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

class RegisterNowButtonWidget extends StatefulWidget {
  const RegisterNowButtonWidget({super.key});

  @override
  State<RegisterNowButtonWidget> createState() =>
      _RegisterNowButtonWidgetState();
}

class _RegisterNowButtonWidgetState extends State<RegisterNowButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 18, bottom: 23),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: AppColors.primaryButtonBackground,
        ),
        child: Text(
          Strings.registerNow.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.firaSans,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
