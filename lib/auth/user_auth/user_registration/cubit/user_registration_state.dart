part of 'user_registration_cubit.dart';

abstract class UserRegistrationState extends Equatable {
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationShowToast extends UserRegistrationState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  UserRegistrationShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}

class UserRegistrationLoading extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationOtpLoading extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationTermsAndCondition extends UserRegistrationState {
  final bool isChecked;

  const UserRegistrationTermsAndCondition({required this.isChecked});

  @override
  List<Object> get props => [isChecked];
}

class UserRegistrationOpenOtpPage extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationGotoUserHomePage extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationPhotoSelected extends UserRegistrationState {
  final File profilePicture;

  const UserRegistrationPhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class UserRegistrationCloseButtonClicked extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationOtpCloseButtonClicked extends UserRegistrationState {
  @override
  List<Object> get props => [];
}
