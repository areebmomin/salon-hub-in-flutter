part of 'user_login_repository.dart';

abstract class VerifyPhoneNumberState extends Equatable {
  const VerifyPhoneNumberState();
}

class VerifyPhoneNumberCompleted extends VerifyPhoneNumberState {
  @override
  List<Object> get props => [];
}

class VerifyPhoneNumberFailed extends VerifyPhoneNumberState {
  const VerifyPhoneNumberFailed({required this.message, required this.code});

  final String message;
  final String code;

  @override
  List<Object> get props => [message, code];
}

class VerifyPhoneNumberCodeSent extends VerifyPhoneNumberState {
  @override
  List<Object> get props => [];
}

class VerifyPhoneNumberTimeout extends VerifyPhoneNumberState {
  @override
  List<Object> get props => [];
}
