part of 'salon_profile_page_cubit.dart';

abstract class SalonProfilePageState extends Equatable {
  const SalonProfilePageState();
}

class Initial extends SalonProfilePageState {
  @override
  List<Object> get props => [];
}

class LoadSalonProfile extends SalonProfilePageState {
  const LoadSalonProfile();

  @override
  List<Object> get props => [];
}

class GotoLoginPage extends SalonProfilePageState {
  @override
  List<Object> get props => [];
}

class GotoEditProfilePage extends SalonProfilePageState {
  final SalonProfileInfo salonProfileInfo;

  const GotoEditProfilePage(this.salonProfileInfo);

  @override
  List<Object> get props => [salonProfileInfo, identityHashCode(this)];
}

class ShowToast extends SalonProfilePageState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

class LoadOwnerProfilePicture extends SalonProfilePageState {
  const LoadOwnerProfilePicture();

  @override
  List<Object> get props => [];
}

class LoadAttendeeProfilePicture extends SalonProfilePageState {
  const LoadAttendeeProfilePicture();

  @override
  List<Object> get props => [];
}
