import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/schedule_tab_view/schedule_tab_view_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'schedule_tab_state.dart';

class ScheduleTabCubit extends Cubit<ScheduleTabState> {
  ScheduleTabCubit(this._repository) : super(Initial());

  final ScheduleTabViewRepository _repository;

  Future<void> fetchScheduledBookings(String formattedDate) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      var scheduledList = await _repository.getScheduledBookings(formattedDate);
      emit(ShowScheduledBookingList(scheduledList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }
}
