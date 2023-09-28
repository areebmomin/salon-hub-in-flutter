import 'package:flutter/material.dart';
import 'package:salon_hub/salon/request_tab_view/request_tab_view.dart';
import 'package:salon_hub/salon/schedule_tab_view/schedule_tab_view.dart';
import '../utils/index.dart';

part 'widgets/salon_hub_toolbar.dart';

class SalonHomePage extends StatefulWidget {
  const SalonHomePage({super.key});

  @override
  State<SalonHomePage> createState() => _SalonHomePageState();
}

class _SalonHomePageState extends State<SalonHomePage> {
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
        height: 64,
        backgroundColor: AppColors.inputFieldBackground,
        elevation: 3,
        shadowColor: Colors.grey.shade200,
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
