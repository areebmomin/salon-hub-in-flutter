part of 'request_tab_view_repository.dart';

class _FirebaseRequestTabViewDatabaseService
    implements _RequestTabViewDatabaseService {
  final _db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<List<BookingData>> fetchAllBookingRequest() {
    return _db.collection('booking').doc(uid).collection('requests').get().then(
      (querySnapshot) {
        List<BookingData> bookingList = [];
        for (var docSnapshot in querySnapshot.docs) {
          bookingList.add(BookingData.fromDocumentSnapshot(docSnapshot.data()));
        }
        return bookingList;
      },
      onError: (e) {
        debugPrint('Error getting collection: $e');
        throw DatabaseException('Unable to load salon data');
      },
    );
  }

  @override
  Future<List<BookingData>> fetchAllDeclinedBookings() {
    return _db.collection('booking').doc(uid).collection('declined').get().then(
          (querySnapshot) {
        List<BookingData> bookingList = [];
        for (var docSnapshot in querySnapshot.docs) {
          bookingList.add(BookingData.fromDocumentSnapshot(docSnapshot.data()));
        }
        return bookingList;
      },
      onError: (e) {
        debugPrint('Error getting collection: $e');
        throw DatabaseException('Unable to load salon data');
      },
    );
  }

  @override
  Future<void> addBookingToDecline(BookingData bookingData) async {
    await _db
        .collection('booking')
        .doc(uid)
        .collection('declined')
        .doc(bookingData.bookingId)
        .set(bookingData.toBookingMap());
  }

  @override
  Future<void> addBookingToSchedule(BookingData bookingData) async {
    await _db
        .collection('booking')
        .doc(uid)
        .collection('schedule')
        .doc(bookingData.bookingId)
        .set(bookingData.toBookingMap());
  }

  @override
  Future<void> removeBookingFromRequest(String bookingId) async {
    _db
        .collection('booking')
        .doc(uid)
        .collection('requests')
        .doc(bookingId)
        .delete();
  }

  @override
  Future<void> updateBookingHistory(BookingData bookingData) async {
    await _db
        .collection('booking_history')
        .doc(bookingData.userId)
        .collection('bookings')
        .doc(bookingData.bookingId)
        .update(bookingData.toUpdateStatusMap());
  }
}

abstract class _RequestTabViewDatabaseService {
  Future<List<BookingData>> fetchAllBookingRequest();

  Future<List<BookingData>> fetchAllDeclinedBookings();

  Future<void> removeBookingFromRequest(String bookingId);

  Future<void> addBookingToSchedule(BookingData bookingData);

  Future<void> addBookingToDecline(BookingData bookingData);

  Future<void> updateBookingHistory(BookingData bookingData);
}
