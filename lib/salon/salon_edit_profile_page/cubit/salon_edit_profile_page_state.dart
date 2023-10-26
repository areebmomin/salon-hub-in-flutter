part of 'salon_edit_profile_page_cubit.dart';

abstract class SalonEditProfilePageState extends Equatable {
  const SalonEditProfilePageState();
}

class Initial extends SalonEditProfilePageState {
  @override
  List<Object> get props => [];
}

class Loading extends SalonEditProfilePageState {
  @override
  List<Object> get props => [];
}

class PhotoSelected extends SalonEditProfilePageState {
  final File profilePicture;

  const PhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class ServicesUpdated extends SalonEditProfilePageState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class OwnerDetailsListUpdated extends SalonEditProfilePageState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class AttendeeDetailsListUpdated extends SalonEditProfilePageState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class ShowToast extends SalonEditProfilePageState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class OwnerPhotoSelected extends SalonEditProfilePageState {
  final File profilePicture;
  final int index;

  const OwnerPhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class AttendeePhotoSelected extends SalonEditProfilePageState {
  final File profilePicture;
  final int index;

  const AttendeePhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class ProfileDataUpdateSuccess extends SalonEditProfilePageState {
  @override
  List<Object> get props => [];
}
