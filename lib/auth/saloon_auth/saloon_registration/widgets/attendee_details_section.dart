import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/index.dart';

class AttendeeDetailsWidget extends StatefulWidget {
  const AttendeeDetailsWidget({super.key});

  @override
  State<AttendeeDetailsWidget> createState() => _AttendeeDetailsWidgetState();
}

class _AttendeeDetailsWidgetState extends State<AttendeeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, top: 32),
            child: const Text(
              Strings.attendeeDetails,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.headingTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: Row(
              children: [
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Assets.userProfileDummy),
                        radius: 40,
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 67,
                      child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: 'msg');
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.inputText,
                      ),
                      hintText: Strings.name,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColors.inputFieldBackground,
              fixedSize: const Size(42, 46),
            ),
            child: const Icon(
              Icons.add_rounded,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
