import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/schedule_tab_view/schedule_tab_view_repository.dart';
import 'package:salon_hub/salon/schedule_tab_view/cubit/schedule_tab_cubit.dart';
import 'package:salon_hub/utils/index.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/select_date.dart';

part 'widgets/schedule_list.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ScheduleTabViewRepository>(
      create: (context) => FirebaseScheduleTabViewRepository(),
      child: BlocProvider(
        create: (context) => ScheduleTabCubit(
          RepositoryProvider.of<ScheduleTabViewRepository>(context),
        ),
        child: BlocListener<ScheduleTabCubit, ScheduleTabState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: BlocBuilder<ScheduleTabCubit, ScheduleTabState>(
            buildWhen: (previousState, state) {
              return state is ShowScheduledBookingList || state is Loading;
            },
            builder: (context, state) {
              if (state is ShowScheduledBookingList) {
                return Container(
                  color: AppColors.primaryBackground,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SelectDate(),
                      Expanded(child: ScheduleList(state.bookingList)),
                    ],
                  ),
                );
              } else if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
