import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_edit_profile_page_state.dart';

class UserEditProfilePageCubit extends Cubit<UserEditProfilePageState> {
  UserEditProfilePageCubit() : super(Initial());
}
