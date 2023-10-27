part of 'book_page_repository.dart';

class _FirebaseBookPageDatabaseService implements _BookPageDatabaseService {
  final _db = FirebaseFirestore.instance;

  @override
  Future<void> addBookingDataForSalon(BookSlot bookSlot) async {
    await _db
        .collection('booking')
        .doc(bookSlot.salonId)
        .collection('requests')
        .doc(bookSlot.bookingId)
        .set(bookSlot.toBookingRequestMap());
  }

  @override
  Future<void> addBookingDataForUser(BookSlot bookSlot) async {
    await _db
        .collection('booking_history')
        .doc(bookSlot.userId)
        .collection('bookings')
        .doc(bookSlot.bookingId)
        .set(bookSlot.toBookingHistoryMap());
  }
}

abstract class _BookPageDatabaseService {
  Future<void> addBookingDataForSalon(BookSlot bookSlot);

  Future<void> addBookingDataForUser(BookSlot bookSlot);
}
