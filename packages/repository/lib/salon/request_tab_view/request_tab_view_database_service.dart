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
}

abstract class _RequestTabViewDatabaseService {
  Future<List<BookingData>> fetchAllBookingRequest();
}
