import 'package:flutter/material.dart';

import '../../index.dart';

class SaloonRegistrationWidget extends StatefulWidget {
  const SaloonRegistrationWidget({super.key});

  @override
  State<SaloonRegistrationWidget> createState() =>
      _SaloonRegistrationWidgetState();
}

class _SaloonRegistrationWidgetState extends State<SaloonRegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoOverscrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
