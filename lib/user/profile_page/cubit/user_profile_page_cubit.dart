import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/user_profile_page/user_profile_page_repository.dart';

part 'user_profile_page_state.dart';

class UserProfilePageCubit extends Cubit<UserProfilePageState> {
  UserProfilePageCubit(this._repository) : super(Initial());

  final UserProfilePageRepository _repository;

  Future<void> logout() async {
      await _repository.logout();
      emit(GotoLoginPage());
  }

  void gotoUserProfilePage() {
    emit(GotoEditProfilePage());
  }
}
