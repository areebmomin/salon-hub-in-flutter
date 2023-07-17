import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_registration_state.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  UserRegistrationCubit() : super(UserRegistrationInitial());
}
