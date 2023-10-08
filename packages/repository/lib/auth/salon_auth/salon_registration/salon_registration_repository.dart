import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'models/salon_registration_data.dart';
import 'salon_registration_states.dart';

part 'signup_with_login_password_exception.dart';

part 'salon_registration_auth_service.dart';

part 'salon_registration_database_service.dart';

part 'salon_registration_storage_service.dart';

class FirebaseSalonRegistrationRepository
    implements SalonRegistrationRepository {
  late final _SalonRegistrationAuthService _authService =
      _FirebaseSalonRegistrationAuthService();
  late final _SalonRegistrationDatabaseService _databaseService =
      _FirebaseSalonRegistrationDatabaseService();
  late final _SalonRegistrationStorageService _storageService =
      _FirebaseSalonRegistrationStorageService();

  @override
  Stream<SalonRegistrationRepositoryState> registerSalon(
      {required SalonRegistrationData data}) async* {
    try {
      // register new salon
      var credential = await _authService.registerUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );

      // add salon data to database
      var uid = credential.user?.uid ?? '';
      await _databaseService.addNewSalonData(data, uid);

      // upload salon photo to storage
      if (data.profilePicture != null) {
        await _storageService.uploadSalonProfilePicture(
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
      yield Failure(e.message ?? 'Server error');
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

abstract class SalonRegistrationRepository {
  Stream<SalonRegistrationRepositoryState> registerSalon(
      {required SalonRegistrationData data});
}
