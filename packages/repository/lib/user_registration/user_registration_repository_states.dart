import 'package:equatable/equatable.dart';

abstract class UserRegistrationRepositoryState extends Equatable {
  const UserRegistrationRepositoryState();
}

class UserRegistrationRepositorySuccess
    extends UserRegistrationRepositoryState {
  @override
  List<Object?> get props => [];
}

class UserRegistrationRepositoryFailure
    extends UserRegistrationRepositoryState {
  final String message;

  const UserRegistrationRepositoryFailure(this.message);

  @override
  List<Object?> get props => [message];
}
