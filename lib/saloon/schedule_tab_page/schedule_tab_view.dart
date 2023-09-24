import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:salon_hub/utils/index.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/select_date.dart';

part 'widgets/schedule_list.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectDate(),
          Expanded(child: ScheduleList()),
        ],
      ),
    );
  }
}
