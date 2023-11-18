part of 'schedule_tab_view_repository.dart';

class _FirebaseScheduleTabDatabaseService
    implements _ScheduleTabDatabaseService {
  final _db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<List<BookingData>> fetchScheduledBooking(String formattedDate) {
    return _db
        .collection('booking')
        .doc(uid)
        .collection('schedule')
        .doc(formattedDate)
        .collection(formattedDate)
        .get()
        .then(
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
}

abstract class _ScheduleTabDatabaseService {
  Future<List<BookingData>> fetchScheduledBooking(String formattedDate);
}
