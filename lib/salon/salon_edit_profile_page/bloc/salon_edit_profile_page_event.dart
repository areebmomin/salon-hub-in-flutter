part of 'salon_edit_profile_page_bloc.dart';

abstract class SalonEditProfilePageEvent extends Equatable {
  const SalonEditProfilePageEvent();
}

final class SetSalonPhoto extends SalonEditProfilePageEvent {
  const SetSalonPhoto();

  @override
  List<Object> get props => [];
}

final class SaveDetailsButtonClicked extends SalonEditProfilePageEvent {
  const SaveDetailsButtonClicked();

  @override
  List<Object> get props => [];
}

final class AddService extends SalonEditProfilePageEvent {
  const AddService(this.service);

  final String service;

  @override
  List<Object> get props => [service];
}

final class RemoveService extends SalonEditProfilePageEvent {
  const RemoveService(this.service);

  final String service;

  @override
  List<Object> get props => [service];
}

final class AddOwner extends SalonEditProfilePageEvent {
  const AddOwner();

  @override
  List<Object> get props => [];
}

final class RemoveOwner extends SalonEditProfilePageEvent {
  const RemoveOwner(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class AddAttendee extends SalonEditProfilePageEvent {
  const AddAttendee();

  @override
  List<Object> get props => [];
}

final class RemoveAttendee extends SalonEditProfilePageEvent {
  const RemoveAttendee(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class SetOwnerPhoto extends SalonEditProfilePageEvent {
  const SetOwnerPhoto(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class SetAttendeePhoto extends SalonEditProfilePageEvent {
  const SetAttendeePhoto(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
