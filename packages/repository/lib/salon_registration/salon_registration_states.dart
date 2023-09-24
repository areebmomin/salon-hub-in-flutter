import 'package:equatable/equatable.dart';

abstract class SalonRegistrationRepositoryState extends Equatable {
  const SalonRegistrationRepositoryState();
}

class Success extends SalonRegistrationRepositoryState {
  @override
  List<Object?> get props => [];
}

class Failure extends SalonRegistrationRepositoryState {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
