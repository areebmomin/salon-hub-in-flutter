import 'dart:async';
import 'dart:io';
import 'package:repository/saloon_registration/models/saloon_registration_data.dart';
import 'package:repository/saloon_registration/saloon_registration_database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'saloon_registration_states.dart';
import 'saloon_registration_storage_service.dart';

part 'signup_with_login_password_exception.dart';

part 'saloon_registration_auth_service.dart';

class FirebaseSaloonRegistrationRepository
    implements SaloonRegistrationRepository {
  late final SaloonRegistrationAuthService _authService =
      FirebaseSaloonRegistrationAuthService();
  late final SaloonRegistrationDatabaseService _databaseService =
      FirebaseSaloonRegistrationDatabaseService();
  late final SaloonRegistrationStorageService _storageService =
      FirebaseSaloonRegistrationStorageService();

  @override
  Stream<SaloonRegistrationRepositoryState> registerSaloon(
      {required SaloonRegistrationData data}) async* {
    try {
      // register new saloon
      var credential = await _authService.registerUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );

      // add saloon data to database
      var uid = credential.user?.uid ?? '';
      await _databaseService.addNewSaloonData(data, uid);

      // upload saloon photo to storage
      if (data.profilePicture != null) {
        await _storageService.uploadSaloonProfilePicture(
            data.profilePicture!, uid);
      }

      // upload owner photos to storage
      await _storageService.uploadOwnersProfilePicture(
          data.ownerDetailsList.extractProfilePictures(), uid);

      // upload attendee photos to storage
      await _storageService.uploadAttendeesProfilePicture(
          data.attendeeDetailList.extractProfilePictures(), uid);

      yield Success();
    } on FirebaseException catch (e) {
      yield Failure(e.message ?? "Server error");
    }
  }
}

extension on List<OwnerDetail> {
  List<File?> extractProfilePictures() {
    return map((ownerDetail) => ownerDetail.profilePicture).toList();
  }
}

extension on List<AttendeeDetail> {
  List<File?> extractProfilePictures() {
    return map((attendeeDetail) => attendeeDetail.profilePicture).toList();
  }
}

abstract class SaloonRegistrationRepository {
  Stream<SaloonRegistrationRepositoryState> registerSaloon(
      {required SaloonRegistrationData data});
}
