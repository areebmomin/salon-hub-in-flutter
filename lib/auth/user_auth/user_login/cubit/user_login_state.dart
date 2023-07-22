part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class UserLoginInitial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginShowToast extends UserLoginState {

  final String message;

  const UserLoginShowToast({required this.message});

  @override
  List<Object> get props => [message];
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
