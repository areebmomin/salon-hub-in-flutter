import 'package:flutter/material.dart';

class BookSlot {
  int date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<String> services;
  String note;

  BookSlot.getDefault()
      : date = 0,
        startTime = TimeOfDay.now(),
        endTime = TimeOfDay.now(),
        services = List.empty(),
        note = '';

  BookSlot(this.date, this.startTime, this.endTime, this.services, this.note);

  @override
  String toString() {
    return 'Date: $date, Start time: ${startTime.toString()}, End time: ${endTime.toString()}, Services: $services, Note: $note';
  }
}
