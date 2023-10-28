import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/exceptions/database_exception.dart';
import '../request_tab_view/models/booking_data.dart';

part 'schedule_tab_view_database_service.dart';

part 'schedule_tab_view_storage_service.dart';

class FirebaseScheduleTabViewRepository implements ScheduleTabViewRepository {
  late final _ScheduleTabViewDatabaseService _databaseService =
      _FirebaseScheduleTabViewDatabaseService();
  late final _ScheduleTabViewStorageService _storageService =
      _FirebaseScheduleTabViewStorageService();

  @override
  Future<List<BookingData>> getScheduledBookings(String formattedDate) async {
    var scheduledBookingList = await _databaseService.fetchScheduledBooking(formattedDate);

    final futures = <Future<String>>[];
    for (var booking in scheduledBookingList) {
      futures.add(_getUserProfilePictureUrl(booking.userId));
    }
    final urls = await Future.wait(futures);
    scheduledBookingList.asMap().forEach((key, value) {
      value.userProfilePictureUrl = urls[key];
    });

    return scheduledBookingList;
  }

  Future<String> _getUserProfilePictureUrl(String userId) async {
    try {
      return await _storageService.getUserProfilePictureUrl(userId);
    } catch (e) {
      return '';
    }
  }
}

abstract class ScheduleTabViewRepository {
  Future<List<BookingData>> getScheduledBookings(String formattedDate);
}
