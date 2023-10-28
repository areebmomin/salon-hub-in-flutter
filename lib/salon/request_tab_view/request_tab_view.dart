import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/request_tab_view/request_tab_view_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/index.dart';
import 'cubit/request_tab_cubit.dart';

part 'widgets/request_list.dart';

part 'widgets/declined_request_list.dart';

class RequestTabView extends StatelessWidget {
  const RequestTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RequestTabViewRepository>(
      create: (context) => FirebaseRequestTabViewRepository(),
      child: BlocProvider(
        create: (context) => RequestTabCubit(
          RepositoryProvider.of<RequestTabViewRepository>(context),
        ),
        child: BlocListener<RequestTabCubit, RequestTabState>(
          listener: (context, state) {
            if (state is ShowToast) {
              Fluttertoast.showToast(
                  msg: state.message, toastLength: Toast.LENGTH_SHORT);
            }
          },
          child: BlocBuilder<RequestTabCubit, RequestTabState>(
            buildWhen: (previousState, state) {
              return state is ShowBookingList || state is Loading;
            },
            builder: (context, state) {
              if (state is ShowBookingList) {
                var listSize =
                    state.requestList.length + state.declinedList.length;
                return Container(
                  color: AppColors.primaryBackground,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: listSize,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < state.requestList.length) {
                        return RequestList(index, state.requestList[index]);
                      } else {
                        var declinedIndex = index - state.requestList.length;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (declinedIndex == 0)
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  bottom: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  Strings.declined,
                                  style: TextStyleConstants.textField,
                                ),
                              ),
                            DeclinedRequestList(
                                state.declinedList[declinedIndex]),
                          ],
                        );
                      }
                    },
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

enum ScheduleOption { notes }
