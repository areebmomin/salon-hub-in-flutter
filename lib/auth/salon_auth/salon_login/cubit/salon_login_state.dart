part of 'salon_login_cubit.dart';

abstract class SalonLoginState extends Equatable {
  const SalonLoginState();
}

class Initial extends SalonLoginState {
  @override
  List<Object> get props => [];
}

class Loading extends SalonLoginState {
  @override
  List<Object> get props => [];
}

class Success extends SalonLoginState {
  @override
  List<Object> get props => [];
}

class Failure extends SalonLoginState {
  @override
  List<Object> get props => [];
}

class ShowToast extends SalonLoginState {
  final String message;

  const ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
