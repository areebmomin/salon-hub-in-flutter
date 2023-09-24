import 'package:equatable/equatable.dart';

abstract class SaloonRegistrationRepositoryState extends Equatable {
  const SaloonRegistrationRepositoryState();
}

class Success extends SaloonRegistrationRepositoryState {
  @override
  List<Object?> get props => [];
}

class Failure extends SaloonRegistrationRepositoryState {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
