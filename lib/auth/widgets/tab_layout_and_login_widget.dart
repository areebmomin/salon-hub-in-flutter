part of '../login_page.dart';

class TabLayoutAndLoginWidget extends StatefulWidget {
  const TabLayoutAndLoginWidget({super.key});

  @override
  State<TabLayoutAndLoginWidget> createState() => _TabLayoutAndLoginWidgetState();
}

class _TabLayoutAndLoginWidgetState extends State<TabLayoutAndLoginWidget> {
  TabType selectedTab = TabType.customerTab;

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
    switch(selectedTab) {
      case TabType.customerTab:
        return const UserLoginWidget();
      case TabType.salonTab:
        return const SalonLoginWidget();
    }
  }
}

enum TabType {
  customerTab,
  salonTab,
}
