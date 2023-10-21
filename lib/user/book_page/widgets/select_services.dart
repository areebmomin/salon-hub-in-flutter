part of '../book_page.dart';

class SelectServices extends StatefulWidget {
  const SelectServices({super.key});

  @override
  State<SelectServices> createState() => _SelectServicesState();
}

class _SelectServicesState extends State<SelectServices> {
  final List<String> _selectedServices = <String>[];

  @override
  Widget build(BuildContext context) {
    late var cubit = context.read<BookPageCubit>();
    cubit.bookSlot.services = _selectedServices;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        children: [
          const Text(Strings.services,
              style: TextStyleConstants.bookSlotSubHeading),
          const SizedBox(width: 8),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: servicePosition(cubit.salonInfo.services).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> servicePosition(List<String> services) sync* {
    for (String service in services) {
      bool isSelected = _selectedServices.contains(service);
      yield Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FilterChip(
          elevation: 1,
          pressElevation: 4,
          backgroundColor: Colors.white,
          checkmarkColor: Colors.white,
          label: Text(service),
          labelStyle: isSelected
              ? TextStyleConstants.serviceChipSelected
              : TextStyleConstants.serviceChipUnselected,
          selected: isSelected,
          selectedColor: AppColors.primaryButtonBackground,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedServices.add(service);
              } else {
                _selectedServices.removeWhere((String name) {
                  return name == service;
                });
              }
            });
          },
        ),
      );
    }
  }
}
