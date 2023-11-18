import 'dart:io';
import 'package:repository/auth/user_auth/user_registration/models/user_registration_data.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_repository.dart';
import 'package:repository/auth/user_auth/user_registration/user_registration_repository_states.dart';

class FakeUserRepositoryRepository implements UserRegistrationRepository {
  var returnSuccess = true;

  @override
  Stream<UserRegistrationRepositoryState> addNewUserDataAndPhoto(
    UserRegistrationData data,
    String uid,
    File? imageFile,
  ) async* {
    if (returnSuccess) {
      yield UserRegistrationRepositorySuccess();
    } else {
      yield const UserRegistrationRepositoryFailure('Server error');
    }
  }
}
