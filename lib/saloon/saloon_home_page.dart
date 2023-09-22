import 'package:flutter/material.dart';
import 'package:saloon_hub/saloon/request_tab_page/request_tab_page.dart';
import 'package:saloon_hub/saloon/schedule_tab_page/schedule_tab_page.dart';
import '../utils/index.dart';

part 'widgets/saloon_hub_toolbar.dart';

class SaloonHomePage extends StatefulWidget {
  const SaloonHomePage({super.key});

  @override
  State<SaloonHomePage> createState() => _SaloonHomePageState();
}

class _SaloonHomePageState extends State<SaloonHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, null),
      body: SafeArea(
        child: <Widget>[
          const ScheduleTabView(),
          const RequestTabView(),
        ][currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: AppColors.inputFieldBackground,
        elevation: 2,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.primaryButtonBackground,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.schedule_rounded),
            icon: Icon(Icons.schedule_outlined),
            label: Strings.schedule,
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_add_outlined),
            selectedIcon: Icon(Icons.bookmark_add_sharp),
            label: Strings.requests,
          ),
        ],
      ),
    );
  }
}
