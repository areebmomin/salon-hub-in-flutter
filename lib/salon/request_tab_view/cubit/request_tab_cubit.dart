import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/request_tab_view/request_tab_view_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'request_tab_state.dart';

class RequestTabCubit extends Cubit<RequestTabState> {
  RequestTabCubit(this._repository) : super(Initial()) {
    _fetchAllBookingRequests();
  }

  final RequestTabViewRepository _repository;

  Future<void> _fetchAllBookingRequests() async {
    try {
      emit(Loading());
      var bookingRequestList = await _repository.getBookingRequests();
      debugPrint(bookingRequestList.toString());
      emit(ShowBookingRequestList(bookingRequestList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  void declineButtonClicked(String salonNote) {
    emit(ShowToast(message: salonNote));
  }

  void acceptButtonClicked(String salonNote) {
    emit(ShowToast(message: salonNote));
  }
}
