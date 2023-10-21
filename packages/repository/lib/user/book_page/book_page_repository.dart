import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'models/book_slot.dart';

part 'book_page_database_service.dart';

class FirebaseBookPageRepository implements BookPageRepository {
  late final _BookPageDatabaseService _databaseService =
      _FirebaseBookPageDatabaseService();
  final _auth = FirebaseAuth.instance;

  @override
  Future<bool> saveBookingData(BookSlot bookSlot) async {
    try {
      // add remaining data to BookSlot
      bookSlot.bookingId = DateTime.now().microsecondsSinceEpoch.toString();
      bookSlot.userId = _auth.currentUser?.uid ?? '';

      // save BookSlot data for salon and user
      await Future.wait([
        _databaseService.addBookingDataForSalon(bookSlot),
        _databaseService.addBookingDataForUser(bookSlot),
      ]);

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

abstract class BookPageRepository {
  Future<bool> saveBookingData(BookSlot bookSlot);
}
