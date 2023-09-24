part of 'salon_registration_cubit.dart';

abstract class SalonRegistrationState extends Equatable {
  const SalonRegistrationState();
}

class Initial extends SalonRegistrationState {
  @override
  List<Object> get props => [];
}

class ShowToast extends SalonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
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
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class OwnerDetailsListUpdated extends SalonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class AttendeeDetailsListUpdated extends SalonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}
