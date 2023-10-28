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

class ShowBookingList extends RequestTabState {
  final List<BookingData> requestList;
  final List<BookingData> declinedList;

  const ShowBookingList(this.requestList, this.declinedList);

  @override
  List<Object> get props => [requestList, declinedList];
}

class ShowToast extends RequestTabState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
