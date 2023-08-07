part of '../saloon_registration_page.dart';

class ServicesTextFieldWidget extends StatefulWidget {
  const ServicesTextFieldWidget({super.key});

  @override
  State<ServicesTextFieldWidget> createState() =>
      _ServicesTextFieldWidgetState();
}

class _ServicesTextFieldWidgetState extends State<ServicesTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 19),
          child: Text(
            Strings.services,
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
              hintText: Strings.businessAddressHint,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.inputText,
              ),
              suffixIcon: Icon(Icons.home_repair_service),
              contentPadding:
              EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.headingTextColor,
            ),
            keyboardType: TextInputType.streetAddress,
          ),
        ),
      ],
    );
  }
}
