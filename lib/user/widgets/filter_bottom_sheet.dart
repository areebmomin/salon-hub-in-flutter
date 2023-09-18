part of '../user_home_page.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, top: 24),
          child: Text(
            Strings.filterByHeading,
            style: TextStyle(
              color: AppColors.headingTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: Strings.firaSans,
            ),
          ),
        ),
        SaloonNameTextField(),
        AvailabilityDropDown(),
        NearMeTextField(),
        AddressTextField(),
        FilterButton(),
      ],
    );
  }
}

class SaloonNameTextField extends StatelessWidget {
  const SaloonNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 24),
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.saloonName,
              hintStyle: TextStyleConstants.textFieldHint,
              suffixIcon: Icon(Icons.business),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
            ),
            style: TextStyleConstants.textField,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onChanged: (name) {
              //cubit.data.businessName = name.trim();
            },
          ),
        ),
      ],
    );
  }
}

class AvailabilityDropDown extends StatefulWidget {
  const AvailabilityDropDown({super.key});

  @override
  State<AvailabilityDropDown> createState() => _AvailabilityDropDownState();
}

class _AvailabilityDropDownState extends State<AvailabilityDropDown> {
  String? selectedValue = Strings.saloonAvailability.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 20, top: 16),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackground,
          border: TextFieldConstants.curvedUnderlineInputBorder,
          enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
          focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
          suffixIcon: DropdownButtonFormField(
            value: selectedValue,
            onChanged: (newValue) {
              //cubit.data.type = newValue ?? '';
              setState(() {
                selectedValue = newValue;
              });
            },
            items: Strings.saloonAvailability
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style: TextStyleConstants.textField,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class NearMeTextField extends StatelessWidget {
  const NearMeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 20, top: 16),
      child: TextField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackground,
          border: TextFieldConstants.curvedUnderlineInputBorder,
          enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
          focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
          hintText: Strings.location,
          hintStyle: TextStyleConstants.textFieldHint,
          suffixIcon: Icon(Icons.add_location_alt),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
        ),
        style: TextStyleConstants.textField,
        keyboardType: TextInputType.streetAddress,
        onChanged: (location) {
          //cubit.data.location = location.trim();
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class AddressTextField extends StatelessWidget {
  const AddressTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 20, top: 16),
      child: TextField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.inputFieldBackground,
          border: TextFieldConstants.curvedUnderlineInputBorder,
          enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
          focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
          hintText: Strings.address,
          hintStyle: TextStyleConstants.textFieldHint,
          suffixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
        ),
        style: TextStyleConstants.textField,
        keyboardType: TextInputType.streetAddress,
        maxLines: 3,
        onChanged: (address) {
          //cubit.data.address = address.trim();
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32, top: 40, right: 16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.primaryButtonBackground,
          ),
          child: Text(
            String.fromCharCode(Icons.check_rounded.codePoint),
            style: TextStyle(
              inherit: false,
              fontSize: 42,
              fontWeight: FontWeight.w800,
              fontFamily: Icons.check_rounded.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
