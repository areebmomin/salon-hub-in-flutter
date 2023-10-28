import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/request_tab_view/request_tab_view_repository.dart';
import 'package:repository/user/book_page/models/book_slot.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

import '../../../utils/strings.dart';

part 'request_tab_state.dart';

class RequestTabCubit extends Cubit<RequestTabState> {
  RequestTabCubit(this._repository) : super(Initial()) {
    _fetchAllBookingRequests();
  }

  final RequestTabViewRepository _repository;
  final List<BookingData> bookingRequestList = List.empty(growable: true);
  final List<BookingData> declinedBookingList = List.empty(growable: true);

  Future<void> _fetchAllBookingRequests() async {
    try {
      emit(Loading());
      var result = await Future.wait([
        _repository.getBookingRequests(),
        _repository.getDeclinedBookings(),
      ]);
      bookingRequestList.addAll(result[0]);
      declinedBookingList.addAll(result[1]);

      emit(ShowBookingList(bookingRequestList, declinedBookingList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  Future<void> declineButtonClicked(int index, String salonNote) async {
    var bookingData = bookingRequestList[index];
    bookingData.status = BookingStatus.cancelled;
    bookingData.salonNote = salonNote;

    await _repository.declineBooking(bookingData);

    bookingRequestList.removeAt(index);

    emit(ShowBookingList(bookingRequestList, declinedBookingList));
    emit(ShowToast(message: Strings.bookingDeclined));
  }

  Future<void> acceptButtonClicked(int index, String salonNote) async {
    var bookingData = bookingRequestList[index];
    bookingData.status = BookingStatus.booked;
    bookingData.salonNote = salonNote;

    await _repository.acceptBooking(bookingData);

    bookingRequestList.removeAt(index);

    emit(ShowBookingList(bookingRequestList, declinedBookingList));
    emit(ShowToast(message: Strings.bookingAccepted));
  }
}
