import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/index.dart';

part 'widgets/saloon_hub_toolbar.dart';

part 'widgets/filter_bottom_sheet.dart';

part 'widgets/filter_floating_action_button.dart';

part 'widgets/saloon_list_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SaloonHubToolbar(),
            Expanded(child: SaloonListView()),
          ],
        ),
      ),
      floatingActionButton: getFilterFloatingButton(context),
    );
  }
}
