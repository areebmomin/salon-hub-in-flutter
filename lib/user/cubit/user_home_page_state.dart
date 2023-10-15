part of 'user_home_page_cubit.dart';

abstract class UserHomePageState extends Equatable {
  const UserHomePageState();
}

class Initial extends UserHomePageState {
  @override
  List<Object> get props => [];
}

class Loading extends UserHomePageState {
  @override
  List<Object> get props => [];
}

class ShowSalonList extends UserHomePageState {
  final List<UserHomePageSalonInfo> salonList;

  const ShowSalonList(this.salonList);

  @override
  List<Object> get props => [salonList];
}

class ShowToast extends UserHomePageState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}

