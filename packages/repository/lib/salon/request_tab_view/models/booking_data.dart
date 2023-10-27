import 'package:intl/intl.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import '../../../user/book_page/models/book_slot.dart';
import '../../../utils/enum_utils.dart';

class BookingData {
  final String bookingId;
  final int date;
  String formattedDate;
  final ServiceTime serviceTime;
  final List<String> services;
  final String userNote;
  String salonNote;
  final String userId;
  BookingStatus status;
  final String userName;
  final String userPhoneNumber;
  String userProfilePictureUrl;

  BookingData.getDefault()
      : bookingId = '',
        date = 0,
        formattedDate = '',
        serviceTime = ServiceTime(
            startTime: Time(hour: 9, minute: 0),
            endTime: Time(hour: 5, minute: 0)),
        services = List.empty(),
        userNote = '',
        salonNote = '',
        userId = '',
        status = BookingStatus.pending,
        userName = '',
        userPhoneNumber = '',
        userProfilePictureUrl = '';

  BookingData(
    this.bookingId,
    this.date,
    this.formattedDate,
    this.serviceTime,
    this.services,
    this.userNote,
    this.salonNote,
    this.userId,
    this.status,
    this.userName,
    this.userPhoneNumber,
    this.userProfilePictureUrl,
  );

  Map<String, dynamic> toUpdateStatusMap() {
    return <String, dynamic>{
      'salon_note': salonNote,
      'status': status.name,
    };
  }

  Map<String, dynamic> toBookingMap() {
    return <String, dynamic>{
      'booking_id': bookingId,
      'date': date,
      'service_time': serviceTime.toMap(),
      'services': services,
      'user_note': userNote,
      'salon_note': salonNote,
      'user_id': userId,
      'status': status.name,
      'user_name': userName,
      'user_phone_number': userPhoneNumber,
    };
  }

  BookingData.fromDocumentSnapshot(Map<String, dynamic> doc)
      : bookingId = doc['booking_id'] ?? '',
        date = doc['date'] ?? '',
        formattedDate = '',
        serviceTime = ServiceTime.fromDocumentSnapshot(doc['service_time']),
        services = (doc['services'] as List).map((e) => e as String).toList(),
        userNote = doc['user_note'] ?? '',
        salonNote = doc['salon_note'] ?? '',
        userId = doc['user_id'] ?? '',
        status = enumFromString(BookingStatus.values, doc['status'] ?? '',
            defaultValue: BookingStatus.pending),
        userName = doc['user_name'] ?? '',
        userPhoneNumber = doc['user_phone_number'] ?? '',
        userProfilePictureUrl = '' {
    formattedDate = DateFormat('dd MMM yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(date));
  }

  @override
  String toString() {
    return 'BookingData{bookingId: $bookingId, date: $date, formattedDate: $formattedDate, serviceTime: $serviceTime, services: $services, userNote: $userNote, salonNote: $salonNote, userId: $userId, status: $status, userName: $userName, userPhoneNumber: $userPhoneNumber, userProfilePictureUrl: $userProfilePictureUrl}';
  }
}
