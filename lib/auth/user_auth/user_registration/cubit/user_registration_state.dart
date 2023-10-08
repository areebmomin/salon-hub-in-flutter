part of 'user_registration_cubit.dart';

abstract class UserRegistrationState extends Equatable {
  const UserRegistrationState();
}

class Initial extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class ShowToast extends UserRegistrationState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class Loading extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class OtpLoading extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class TermsAndCondition extends UserRegistrationState {
  final bool isChecked;

  const TermsAndCondition({required this.isChecked});

  @override
  List<Object> get props => [isChecked];
}

class OpenOtpPage extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class GotoUserHomePage extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class PhotoSelected extends UserRegistrationState {
  final File profilePicture;

  const PhotoSelected({required this.profilePicture});

  @override
  List<Object> get props => [profilePicture];
}

class CloseButtonClicked extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class OtpCloseButtonClicked extends UserRegistrationState {
  @override
  List<Object> get props => [];
}
