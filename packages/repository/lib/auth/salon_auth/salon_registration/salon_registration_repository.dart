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

      final futures = <Future<void>>[];

      // add salon data to database
      var uid = credential.user?.uid ?? '';
      futures.add(_databaseService.addNewSalonData(data, uid));

      // upload salon photo to storage
      if (data.profilePicture != null) {
        futures.add(_storageService.uploadSalonProfilePicture(
            data.profilePicture!, uid));
      }

      // upload owner photos to storage
      futures.add(_storageService.uploadOwnersProfilePicture(
          data.ownerDetailsList.extractProfilePictures(), uid));

      // upload attendee photos to storage
      futures.add(_storageService.uploadAttendeesProfilePicture(
          data.attendeeDetailList.extractProfilePictures(), uid));

      await Future.wait(futures);

      yield Success();
    } on FirebaseException catch (e) {
      yield Failure(e.message ?? 'Server error');
    }
  }
}

abstract class SalonRegistrationRepository {
  Stream<SalonRegistrationRepositoryState> registerSalon(
      {required SalonRegistrationData data});
}
