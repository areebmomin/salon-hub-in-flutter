part of 'salon_registration_bloc.dart';

abstract class SalonRegistrationEvent extends Equatable {
  const SalonRegistrationEvent();
}

final class SaveDetailsButtonClicked extends SalonRegistrationEvent {
  const SaveDetailsButtonClicked();

  @override
  List<Object> get props => [];
}

final class AddService extends SalonRegistrationEvent {
  const AddService(this.service);

  final String service;

  @override
  List<Object> get props => [service];
}

final class RemoveService extends SalonRegistrationEvent {
  const RemoveService(this.service);

  final String service;

  @override
  List<Object> get props => [service];
}

final class RegisterNowButtonClicked extends SalonRegistrationEvent {
  const RegisterNowButtonClicked();

  @override
  List<Object> get props => [];
}

final class SetSalonPhoto extends SalonRegistrationEvent {
  const SetSalonPhoto();

  @override
  List<Object> get props => [];
}

final class SetOwnerPhoto extends SalonRegistrationEvent {
  const SetOwnerPhoto(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class SetAttendeePhoto extends SalonRegistrationEvent {
  const SetAttendeePhoto(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class CloseButtonClickedEvent extends SalonRegistrationEvent {
  const CloseButtonClickedEvent();

  @override
  List<Object> get props => [];
}

final class VerifyPageCloseButtonClickedEvent extends SalonRegistrationEvent {
  const VerifyPageCloseButtonClickedEvent();

  @override
  List<Object> get props => [];
}

final class AddOwner extends SalonRegistrationEvent {
  const AddOwner();

  @override
  List<Object> get props => [];
}

final class RemoveOwner extends SalonRegistrationEvent {
  const RemoveOwner(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class AddAttendee extends SalonRegistrationEvent {
  const AddAttendee();

  @override
  List<Object> get props => [];
}

final class RemoveAttendee extends SalonRegistrationEvent {
  const RemoveAttendee(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
