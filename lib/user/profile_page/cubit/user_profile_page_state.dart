part of 'user_profile_page_cubit.dart';

abstract class UserProfilePageState extends Equatable {
  const UserProfilePageState();
}

class Initial extends UserProfilePageState {
  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfilePageState {
  final UserProfile userProfile;

  const LoadUserProfile(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}

class LoadBookingHistory extends UserProfilePageState {
  final List<BookingHistory> bookingHistoryList;

  const LoadBookingHistory(this.bookingHistoryList);

  @override
  List<Object> get props => [];
}

class GotoLoginPage extends UserProfilePageState {
  @override
  List<Object> get props => [];
}

class GotoEditProfilePage extends UserProfilePageState {
  @override
  List<Object> get props => [];
}

class ShowToast extends UserProfilePageState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}
