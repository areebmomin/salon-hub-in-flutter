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
      final results = await Future.wait([
        _repository.getUserProfile(),
        _repository.getProfilePictureUrl(),
      ]);

      UserProfile userProfile = results[0] as UserProfile;
      String url = results[1] as String;
      emit(LoadUserProfile(userProfile, url));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
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
