import 'package:flutter/material.dart';

import '../../../../utils/index.dart';

class BusinessNameTextFieldWidget extends StatefulWidget {
  final Function(bool isValid) onInputValidated;

  const BusinessNameTextFieldWidget(this.onInputValidated, {super.key});

  @override
  State<BusinessNameTextFieldWidget> createState() =>
      _BusinessNameTextFieldWidgetState();
}

class _BusinessNameTextFieldWidgetState
    extends State<BusinessNameTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, left: 19),
          child: Text(
            Strings.businessName,
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
              hintText: Strings.businessNameHint,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.business),
              contentPadding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.name,
            onChanged: (name) {
              widget.onInputValidated(name.trim().isNotEmpty);
            },
          ),
        ),
      ],
    );
  }
}
