part of 'salon_registration_cubit.dart';

abstract class SalonRegistrationState extends Equatable {
  const SalonRegistrationState();
}

class Initial extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class ShowToast extends SalonRegistrationState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class Loading extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class PhotoSelected extends SalonRegistrationState {
  final File profilePicture;

  const PhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class OwnerPhotoSelected extends SalonRegistrationState {
  final File profilePicture;
  final int index;

  const OwnerPhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class AttendeePhotoSelected extends SalonRegistrationState {
  final File profilePicture;
  final int index;

  const AttendeePhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class CloseButtonClicked extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class VerifyCloseButtonClicked extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class OpenVerifyPage extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class GotoSalonHomePage extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class ServicesUpdated extends SalonRegistrationState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class OwnerDetailsListUpdated extends SalonRegistrationState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class AttendeeDetailsListUpdated extends SalonRegistrationState {
  @override
  List<Object> get props => [identityHashCode(this)];
}
