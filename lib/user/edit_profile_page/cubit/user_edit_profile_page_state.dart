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

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class LoadProfileData extends UserEditProfilePageState {
  const LoadProfileData();

  @override
  List<Object> get props => [];
}

class PhotoSelected extends UserEditProfilePageState {
  final File profilePicture;

  const PhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class Loading extends UserEditProfilePageState {
  @override
  List<Object> get props => [];
}

class ProfileDataUpdateSuccess extends UserEditProfilePageState {
  @override
  List<Object> get props => [];
}
