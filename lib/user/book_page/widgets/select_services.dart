part of '../book_page.dart';

class SelectServices extends StatefulWidget {
  const SelectServices({super.key});

  @override
  State<SelectServices> createState() => _SelectServicesState();
}

class _SelectServicesState extends State<SelectServices> {
  final List<CompanyWidget> _companies = <CompanyWidget>[
    const CompanyWidget('CEO'),
    const CompanyWidget('Director'),
    const CompanyWidget('Manager'),
    const CompanyWidget('Team Leader'),
    const CompanyWidget('Employee'),
  ];

  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
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
              children: companyPosition.toList(),
            ),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> get companyPosition sync* {
    for (CompanyWidget company in _companies) {
      bool isSelected = _filters.contains(company.name);
      yield Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FilterChip(
          elevation: 1,
          pressElevation: 4,
          backgroundColor: Colors.white,
          checkmarkColor: Colors.white,
          label: Text(company.name),
          labelStyle: isSelected
              ? TextStyleConstants.serviceChipSelected
              : TextStyleConstants.serviceChipUnselected,
          selected: isSelected,
          selectedColor: AppColors.primaryButtonBackground,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _filters.add(company.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == company.name;
                });
              }
            });
          },
        ),
      );
    }
  }
}

class CompanyWidget {
  const CompanyWidget(this.name);

  final String name;
}
