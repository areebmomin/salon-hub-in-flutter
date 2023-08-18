part of 'saloon_registration_cubit.dart';

abstract class SaloonRegistrationState extends Equatable {
  const SaloonRegistrationState();
}

class SaloonRegistrationInitial extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationShowToast extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  SaloonRegistrationShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}

class SaloonRegistrationLoading extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationPhotoSelected extends SaloonRegistrationState {
  final File profilePicture;

  const SaloonRegistrationPhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class SaloonRegistrationCloseButtonClicked extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationVerifyCloseButtonClicked
    extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationOpenVerifyPage extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationGotoSaloonHomePage extends SaloonRegistrationState {
  @override
  List<Object> get props => [];
}

class SaloonRegistrationServicesUpdated extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class SaloonRegistrationOwnerDetailsListUpdated
    extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}

class SaloonRegistrationAttendeeDetailsListUpdated
    extends SaloonRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [_timeStamp];
}
