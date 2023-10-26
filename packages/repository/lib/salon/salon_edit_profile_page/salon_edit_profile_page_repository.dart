import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import '../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

part 'salon_edit_profile_page_database_service.dart';

part 'salon_edit_profile_page_storage_service.dart';

class FirebaseSalonEditProfilePageRepository
    implements SalonEditProfilePageRepository {
  late final _SalonEditProfilePageDatabaseService _databaseService =
      _FirebaseSalonEditProfilePageDatabaseService();
  late final _SalonEditProfilePageStorageService _storageService =
      _FirebaseSalonEditProfilePageStorageService();

  @override
  Future<void> updateSalonData(EditProfilePageSalonInfo salonInfo) async {
    final futures = <Future<void>>[];

    // add salon data to database
    futures.add(_databaseService.updateSalonData(salonInfo));

    // upload salon photo to storage
    if (salonInfo.profilePicture != null) {
      futures.add(
          _storageService.uploadSalonProfilePicture(salonInfo.profilePicture!));
    }

    // upload owner photos to storage
    futures.add(_storageService.uploadOwnersProfilePicture(
        salonInfo.ownerDetailsList.extractProfilePictures()));

    // upload attendee photos to storage
    futures.add(_storageService.uploadAttendeesProfilePicture(
        salonInfo.attendeeDetailList.extractProfilePictures()));

    await Future.wait(futures);
  }
}

abstract class SalonEditProfilePageRepository {
  Future<void> updateSalonData(EditProfilePageSalonInfo salonInfo);
}
