import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/index.dart';

part 'widgets/saloon_hub_toolbar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SaloonHubToolbar(),
          ],
        ),
      ),
    );
  }
}
