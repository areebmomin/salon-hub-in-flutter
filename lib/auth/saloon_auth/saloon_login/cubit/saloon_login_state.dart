part of 'saloon_login_cubit.dart';

abstract class SaloonLoginState extends Equatable {
  const SaloonLoginState();
}

class SaloonLoginInitial extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class SaloonLoginLoading extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class SaloonLoginSuccess extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class SaloonLoginFailure extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class SaloonLoginShowToast extends SaloonLoginState {

  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  SaloonLoginShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}
