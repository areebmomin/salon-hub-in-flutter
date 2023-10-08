import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/edit_user_profile_page/edit_user_profile_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'user_edit_profile_page_state.dart';

class UserEditProfilePageCubit extends Cubit<UserEditProfilePageState> {
  UserEditProfilePageCubit(this._repository) : super(Initial()) {
    _fetchUserProfileData();
  }

  final EditUserProfileRepository _repository;

  _fetchUserProfileData() async {
    try {
      final results = await Future.wait([
        _repository.getUserProfile(),
        _repository.getProfilePictureUrl(),
      ]);

      UserProfile userProfile = results[0] as UserProfile;
      String url = results[1] as String;
      emit(LoadProfileData(userProfile, url));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }
}
