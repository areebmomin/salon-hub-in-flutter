import 'package:flutter/material.dart';

import '../../../../utils/index.dart';

class NameTextFieldWidget extends StatefulWidget {
  final Function(bool isValid) onInputValidated;

  const NameTextFieldWidget(this.onInputValidated, {super.key});

  @override
  State<NameTextFieldWidget> createState() => _NameTextFieldWidgetState();
}

class _NameTextFieldWidgetState extends State<NameTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.fullName,
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