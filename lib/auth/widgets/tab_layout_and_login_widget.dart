part of '../login_page.dart';

class TabLayoutAndLogin extends StatefulWidget {
  const TabLayoutAndLogin({super.key});

  @override
  State<TabLayoutAndLogin> createState() => _TabLayoutAndLoginState();
}

class _TabLayoutAndLoginState extends State<TabLayoutAndLogin> {
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
