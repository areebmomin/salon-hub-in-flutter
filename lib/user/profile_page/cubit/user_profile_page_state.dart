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
  final String url;

  const LoadUserProfile(this.userProfile, this.url);

  @override
  List<Object> get props => [userProfile, url];
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
  List<Object> get props => [identityHashCode(this)];
}

class ShowToast extends UserProfilePageState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
