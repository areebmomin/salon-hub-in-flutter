part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class Initial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class ShowToast extends UserLoginState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class Loading extends UserLoginState {
  @override
  List<Object> get props => [];
}

class Success extends UserLoginState {
  @override
  List<Object> get props => [];
}

class OtpSent extends UserLoginState {
  @override
  List<Object> get props => [];
}

class OtpTimeout extends UserLoginState {
  @override
  List<Object> get props => [];
}
