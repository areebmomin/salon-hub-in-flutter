import 'package:flutter/material.dart';

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
        status = BookingStatus.pending;

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
  );

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
