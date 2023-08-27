part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class Initial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class ShowToast extends UserLoginState {
  /// placeholder to distinguish from previous [ShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
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
