part of '../login_page.dart';

class TabLayoutAndLoginWidget extends StatefulWidget {
  const TabLayoutAndLoginWidget({super.key});

  @override
  State<TabLayoutAndLoginWidget> createState() =>
      _TabLayoutAndLoginWidgetState();
}

class _TabLayoutAndLoginWidgetState extends State<TabLayoutAndLoginWidget> {
  TabType selectedTab = TabType.customerTab;
  final _userLoginWidget = const UserLoginWidget();
  final _salonLoginWidget = const SalonLoginWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTabLayout((TabType position) {
          if (position != selectedTab) {
            setState(() {
              selectedTab = position;
            });
          }
        }),
        getLoginWidget(),
      ],
    );
  }

  Widget getLoginWidget() {
    switch (selectedTab) {
      case TabType.customerTab:
        return _userLoginWidget;
      case TabType.salonTab:
        return _salonLoginWidget;
    }
  }
}

enum TabType {
  customerTab,
  salonTab,
}
