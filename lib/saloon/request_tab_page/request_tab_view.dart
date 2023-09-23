import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/index.dart';

part 'widgets/request_list.dart';

part 'widgets/declined_request_list.dart';

class RequestTabView extends StatelessWidget {
  const RequestTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return RequestList();
          //DeclinedRequestList(),
        },
      ),
    );
  }
}

enum ScheduleOption { notes }
