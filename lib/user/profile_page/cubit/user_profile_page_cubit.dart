import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_profile_page_state.dart';

class UserProfilePageCubit extends Cubit<UserProfilePageState> {
  UserProfilePageCubit() : super(Initial());
}
