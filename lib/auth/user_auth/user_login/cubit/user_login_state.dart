part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class UserLoginInitial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginShowToast extends UserLoginState {

  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  UserLoginShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}

class UserLoginLoading extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginSuccess extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginOtpSent extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginOtpTimeout extends UserLoginState {
  @override
  List<Object> get props => [];
}
