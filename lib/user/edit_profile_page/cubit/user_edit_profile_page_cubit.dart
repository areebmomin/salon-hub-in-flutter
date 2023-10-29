import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/user/edit_user_profile_page/edit_user_profile_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';
import '../../../utils/index.dart';

part 'user_edit_profile_page_state.dart';

class UserEditProfilePageCubit extends Cubit<UserEditProfilePageState> {
  UserEditProfilePageCubit(this._repository) : super(Initial()) {
    _fetchUserProfileData();
  }

  final EditUserProfileRepository _repository;
  final UserProfile userProfile = UserProfile();
  String url = '';
  File? _imageFile;

  _fetchUserProfileData() async {
    try {
      final results = await Future.wait([
        _repository.getUserProfile(),
        _repository.getProfilePictureUrl(),
      ]);

      userProfile.copy(results[0] as UserProfile);
      url = results[1] as String;

      emit(const LoadProfileData());
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  Future<void> onSaveButtonClicked() async {
    if (state is Loading) return;

    if (userProfile.name.isEmpty) {
      emit(ShowToast(message: Strings.enterName));
      return;
    }

    if (userProfile.email.isNotEmpty &&
        !EmailValidator.validate(userProfile.email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (userProfile.address.isEmpty) {
      emit(ShowToast(message: Strings.enterAddress));
      return;
    }

    emit(Loading());

    var result =
        await _repository.updateUserDataAndPhoto(userProfile, _imageFile);
    if (result) {
      emit(ProfileDataUpdateSuccess());
    } else {
      emit(ShowToast(message: Strings.serverError));
    }
  }

  void getPhotoFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: _imageFile!));
    }
  }
}
