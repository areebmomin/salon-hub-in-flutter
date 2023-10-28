part of 'schedule_tab_cubit.dart';

abstract class ScheduleTabState extends Equatable {
  const ScheduleTabState();
}

class Initial extends ScheduleTabState {
  @override
  List<Object> get props => [];
}

class Loading extends ScheduleTabState {
  @override
  List<Object> get props => [];
}

class ShowScheduledBookingList extends ScheduleTabState {
  final List<BookingData> bookingList;

  const ShowScheduledBookingList(this.bookingList);

  @override
  List<Object> get props => [bookingList];
}

class ShowToast extends ScheduleTabState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
