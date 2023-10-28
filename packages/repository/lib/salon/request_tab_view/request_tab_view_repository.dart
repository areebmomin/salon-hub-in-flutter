import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/exceptions/database_exception.dart';
import 'models/booking_data.dart';

part 'request_tab_view_database_service.dart';

part 'request_tab_view_storage_service.dart';

class FirebaseRequestTabViewRepository implements RequestTabViewRepository {
  late final _RequestTabViewDatabaseService _databaseService =
      _FirebaseRequestTabViewDatabaseService();
  late final _RequestTabViewStorageService _storageService =
      _FirebaseRequestTabViewStorageService();

  @override
  Future<List<BookingData>> getBookingRequests() async {
    var bookingRequestList = await _databaseService.fetchAllBookingRequest();

    final futures = <Future<String>>[];
    for (var booking in bookingRequestList) {
      futures.add(_getUserProfilePictureUrl(booking.userId));
    }
    final urls = await Future.wait(futures);
    bookingRequestList.asMap().forEach((key, value) {
      value.userProfilePictureUrl = urls[key];
    });

    return bookingRequestList;
  }

  @override
  Future<List<BookingData>> getDeclinedBookings() async {
    var bookingRequestList = await _databaseService.fetchAllDeclinedBookings();

    final futures = <Future<String>>[];
    for (var booking in bookingRequestList) {
      futures.add(_getUserProfilePictureUrl(booking.userId));
    }
    final urls = await Future.wait(futures);
    bookingRequestList.asMap().forEach((key, value) {
      value.userProfilePictureUrl = urls[key];
    });

    return bookingRequestList;
  }

  @override
  Future<void> acceptBooking(BookingData bookingData) async {
    await Future.wait([
      _databaseService.removeBookingFromRequest(bookingData.bookingId),
      _databaseService.addBookingToSchedule(bookingData),
      _databaseService.updateBookingHistory(bookingData),
    ]);
  }

  @override
  Future<void> declineBooking(BookingData bookingData) async {
    await Future.wait([
      _databaseService.removeBookingFromRequest(bookingData.bookingId),
      _databaseService.addBookingToDecline(bookingData),
      _databaseService.updateBookingHistory(bookingData),
    ]);
  }

  Future<String> _getUserProfilePictureUrl(String userId) async {
    try {
      return await _storageService.getUserProfilePictureUrl(userId);
    } catch (e) {
      return '';
    }
  }
}

abstract class RequestTabViewRepository {
  Future<List<BookingData>> getBookingRequests();

  Future<List<BookingData>> getDeclinedBookings();

  Future<void> acceptBooking(BookingData bookingData);

  Future<void> declineBooking(BookingData bookingData);
}
