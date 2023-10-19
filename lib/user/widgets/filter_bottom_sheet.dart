part of '../user_home_page.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
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
        SalonNameTextField(),
        const AvailabilityDropDown(),
        const NearMeTextField(),
        AddressTextField(),
        const FilterButton(),
      ],
    );
  }
}

class SalonNameTextField extends StatelessWidget {
  SalonNameTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserHomePageCubit>();

    _controller.text = cubit.filter.salonName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 24),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.salonName,
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
              cubit.filter.salonName = name.trim();
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

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserHomePageCubit>();
    String? selectedValue = Strings.salonAvailability[cubit.filter.salonAvailability];

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
              cubit.filter.salonAvailability = Strings.salonAvailability.indexOf(newValue ?? 'Open/Close');
              setState(() {
                selectedValue = newValue;
              });
            },
            items: Strings.salonAvailability
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
    late var cubit = context.read<UserHomePageCubit>();

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
          cubit.filter.location = location.trim();
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class AddressTextField extends StatelessWidget {
  AddressTextField({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<UserHomePageCubit>();

    _controller.text = cubit.filter.address;

    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 20, top: 16),
      child: TextField(
        controller: _controller,
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
          cubit.filter.address = address.trim();
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
    late var cubit = context.read<UserHomePageCubit>();

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32, top: 40, right: 16),
        child: ElevatedButton(
          onPressed: () {
            cubit.applyFilter();
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
