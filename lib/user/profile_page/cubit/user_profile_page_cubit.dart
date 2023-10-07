import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/user_profile_page/models/booking_history.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/user/user_profile_page/user_profile_page_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'user_profile_page_state.dart';

class UserProfilePageCubit extends Cubit<UserProfilePageState> {
  UserProfilePageCubit(this._repository) : super(Initial()) {
    _fetchUserProfileData();
    // _fetchBookingHistory();
  }

  final UserProfilePageRepository _repository;

  _fetchUserProfileData() async {
    try {
      UserProfile userProfile = await _repository.getUserProfile();
      emit(LoadUserProfile(userProfile));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    }
  }

  _fetchBookingHistory() async {
    try {
      List<BookingHistory> bookingHistoryList =
          await _repository.getUserBookingHistory();
      emit(LoadBookingHistory(bookingHistoryList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    emit(GotoLoginPage());
  }

  void gotoUserProfilePage() {
    emit(GotoEditProfilePage());
  }
}
