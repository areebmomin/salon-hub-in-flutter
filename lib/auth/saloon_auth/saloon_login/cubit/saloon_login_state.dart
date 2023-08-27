part of 'saloon_login_cubit.dart';

abstract class SaloonLoginState extends Equatable {
  const SaloonLoginState();
}

class Initial extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class Loading extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class Success extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class Failure extends SaloonLoginState {
  @override
  List<Object> get props => [];
}

class ShowToast extends SaloonLoginState {
  /// placeholder to distinguish from previous [UserLoginShowToast] state
  final int _timeStamp = DateTime.now().millisecondsSinceEpoch;
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, _timeStamp];
}
