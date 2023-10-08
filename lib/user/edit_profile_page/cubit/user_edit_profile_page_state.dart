part of 'user_edit_profile_page_cubit.dart';

abstract class UserEditProfilePageState extends Equatable {
  const UserEditProfilePageState();
}

class Initial extends UserEditProfilePageState {
  @override
  List<Object> get props => [];
}

class ShowToast extends UserEditProfilePageState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class LoadProfileData extends UserEditProfilePageState {
  final UserProfile userProfile;
  final String url;

  const LoadProfileData(this.userProfile, this.url);

  @override
  List<Object> get props => [userProfile, url];
}
