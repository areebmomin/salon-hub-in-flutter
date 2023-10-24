import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/utils/enum_utils.dart';
import '../../book_page/models/book_slot.dart';

class BookingHistory {
  final String bookingId;
  final String salonName;
  final BookingStatus bookingStatus;
  final String salonProfilePictureUrl;
  final DateTime date;
  final ServiceTime serviceTime;
  final List<String> services;
  final String userNote;
  final String salonNote;

  BookingHistory.fromDocumentSnapshot(Map<String, dynamic> doc)
      : bookingId = doc['booking_id'] ?? '',
        salonName = doc['salon_name'] ?? '',
        bookingStatus = enumFromString(
            BookingStatus.values, doc['status'] ?? '',
            defaultValue: BookingStatus.pending),
        salonProfilePictureUrl = '',
        date = DateTime.fromMillisecondsSinceEpoch(doc['date']),
        serviceTime =
            ServiceTime.fromDocumentSnapshot(doc['service_time'] ?? ''),
        services = (doc['services'] as List).map((e) => e as String).toList(),
        userNote = doc['user_note'] ?? '',
        salonNote = doc['salon_note'] ?? '';

  @override
  String toString() {
    return 'BookingHistory{bookingId: $bookingId, salonName: $salonName, bookingStatus: $bookingStatus, salonProfilePictureUrl: $salonProfilePictureUrl, date: $date, serviceTime: $serviceTime, services: $services, userNote: $userNote, salonNote: $salonNote}';
  }
}
