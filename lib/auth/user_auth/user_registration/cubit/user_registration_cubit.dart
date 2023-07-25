import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_registration_state.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  UserRegistrationCubit() : super(UserRegistrationInitial());
}
