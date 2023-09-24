part of 'salon_registration_cubit.dart';

abstract class SaloonRegistrationState extends Equatable {
  const SaloonRegistrationState();
}

class Initial extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class ShowToast extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}

class Loading extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class PhotoSelected extends SaloonRegistrationState {
  final File profilePicture;

  const PhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class OwnerPhotoSelected extends SaloonRegistrationState {
  final File profilePicture;
  final int index;

  const OwnerPhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class AttendeePhotoSelected extends SaloonRegistrationState {
  final File profilePicture;
  final int index;

  const AttendeePhotoSelected({
    required this.index,
    required this.profilePicture,
  });

  @override
  List<Object> get props => [profilePicture];
}

class CloseButtonClicked extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class VerifyCloseButtonClicked extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class OpenVerifyPage extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class GotoSaloonHomePage extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class ServicesUpdated extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class OwnerDetailsListUpdated extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class AttendeeDetailsListUpdated extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}
