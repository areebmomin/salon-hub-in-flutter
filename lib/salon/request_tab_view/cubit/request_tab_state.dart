part of 'request_tab_cubit.dart';

abstract class RequestTabState extends Equatable {
  const RequestTabState();
}

class Initial extends RequestTabState {
  @override
  List<Object> get props => [];
}

class Loading extends RequestTabState {
  @override
  List<Object> get props => [];
}

class ShowBookingRequestList extends RequestTabState {
  final List<BookingData> bookingList;

  const ShowBookingRequestList(this.bookingList);

  @override
  List<Object> get props => [bookingList];
}

class ShowDeclinedBookingList extends RequestTabState {
  final List<BookingData> bookingList;

  const ShowDeclinedBookingList(this.bookingList);

  @override
  List<Object> get props => [bookingList];
}

class ShowToast extends RequestTabState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
