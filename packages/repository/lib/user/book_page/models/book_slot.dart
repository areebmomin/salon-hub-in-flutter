import 'package:flutter/material.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class BookSlot {
  String bookingId;
  int date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String salonId;
  String salonName;
  List<String> services;
  String userNote;
  String salonNote;
  String userId;
  BookingStatus status;
  String userName;
  String userPhoneNumber;

  BookSlot.getDefault()
      : bookingId = '',
        date = 0,
        startTime = TimeOfDay.now(),
        endTime = TimeOfDay.now(),
        salonId = '',
        salonName = '',
        services = List.empty(),
        userNote = '',
        salonNote = '',
        userId = '',
        status = BookingStatus.pending,
        userName = '',
        userPhoneNumber = '';

  BookSlot(
    this.bookingId,
    this.date,
    this.startTime,
    this.endTime,
    this.salonId,
    this.salonName,
    this.services,
    this.userNote,
    this.salonNote,
    this.userId,
    this.status,
    this.userName,
    this.userPhoneNumber,
  );

  Map<String, dynamic> toBookingHistoryMap() {
    return <String, dynamic>{
      'booking_id': bookingId,
      'date': date,
      'service_time': ServiceTime(
              startTime: Time.fromTimeOfDay(startTime),
              endTime: Time.fromTimeOfDay(endTime))
          .toMap(),
      'salon_id': salonId,
      'salon_name': salonName,
      'services': services,
      'user_note': userNote,
      'salon_note': salonNote,
      'user_id': userId,
      'status': status.name,
    };
  }

  Map<String, dynamic> toBookingRequestMap() {
    return <String, dynamic>{
      'booking_id': bookingId,
      'date': date,
      'service_time': ServiceTime(
              startTime: Time.fromTimeOfDay(startTime),
              endTime: Time.fromTimeOfDay(endTime))
          .toMap(),
      'services': services,
      'user_note': userNote,
      'salon_note': salonNote,
      'user_id': userId,
      'status': status.name,
      'user_name': userName,
      'user_phone_number': userPhoneNumber,
    };
  }

  @override
  String toString() {
    return 'Booking id: $bookingId, Date: $date, Start time: ${startTime.toString()}, End time: ${endTime.toString()}, Salon id: $salonId, Salon name: $salonName,  Services: $services, Note: $userNote, Salon note: $salonNote, User id: $userId, Status: ${status.name}';
  }
}

enum BookingStatus {
  pending,
  booked,
  cancelled,
}
