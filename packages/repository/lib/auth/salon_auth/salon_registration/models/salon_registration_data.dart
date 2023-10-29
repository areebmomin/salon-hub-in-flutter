import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../user/user_home_page/models/user_home_page_salon_info.dart';

part 'extension_helpers.dart';

class SalonRegistrationData {
  File? profilePicture;
  String businessName;
  String phoneNumber;
  String address;
  String location;
  List<String> services;
  String type;
  List<bool> serviceDays;
  ServiceTime serviceTime;
  List<OwnerDetail> ownerDetailsList;
  List<AttendeeDetail> attendeeDetailList;
  String email;
  String password;

  SalonRegistrationData({
    this.profilePicture,
    this.businessName = '',
    this.phoneNumber = '',
    this.address = '',
    this.location = '',
    List<String>? services,
    this.type = 'Male',
    List<bool>? serviceDays,
    ServiceTime? serviceTime,
    List<OwnerDetail>? ownerDetailsList,
    List<AttendeeDetail>? attendeeDetailList,
    this.email = '',
    this.password = '',
  })  : services = services ?? [],
        serviceDays =
            serviceDays ?? [false, true, true, true, true, true, true],
        serviceTime = serviceTime ?? ServiceTime(),
        ownerDetailsList = ownerDetailsList ?? [OwnerDetail()],
        attendeeDetailList = attendeeDetailList ?? [AttendeeDetail()];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'business_name': businessName,
      'phone_number': phoneNumber,
      'address': address,
      'location': location,
      'services': services,
      'type': type,
      'service_days': serviceDays,
      'service_times': serviceTime.toMap(),
      'owner_details_list': ownerDetailsList.extractNames(),
      'attendee_detail_list': attendeeDetailList.extractNames(),
      'email': email,
    };
  }
}

class ServiceTime {
  Time startTime;
  Time endTime;

  ServiceTime({Time? startTime, Time? endTime})
      : startTime = startTime ?? Time(hour: 10, minute: 0),
        endTime = endTime ?? Time(hour: 20, minute: 0);

  Map<String, dynamic> toMap() {
    return {
      'start_time': startTime.toMap(),
      'end_time': endTime.toMap(),
    };
  }

  ServiceTime.fromDocumentSnapshot(Map<String, dynamic> doc)
      : startTime = Time.fromDocumentSnapshot(doc['start_time']),
        endTime = Time.fromDocumentSnapshot(doc['end_time']);

  AvailabilityStatus getAvailabilityStatus(DateTime now) =>
      (now.isAfter(DateTime(now.year, now.month, now.day, startTime.hour,
                  startTime.minute)) &&
              now.isBefore(DateTime(
                  now.year, now.month, now.day, endTime.hour, endTime.minute)))
          ? AvailabilityStatus.open
          : AvailabilityStatus.close;

  @override
  String toString() {
    return '$startTime - $endTime';
  }
}

class Time {
  int hour;
  int minute;

  String get period => hour < 12 ? 'AM' : 'PM';

  int get hourOfPeriod => hour == 0 || hour == 12 ? 12 : hour - periodOffset;

  int get periodOffset => period == 'AM' ? 0 : 12;

  Time({required this.hour, required this.minute});

  Time.fromTimeOfDay(TimeOfDay timeOfDay)
      : hour = timeOfDay.hour,
        minute = timeOfDay.minute;

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      return value < 10 ? '0$value' : value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hourOfPeriod);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$hourLabel:$minuteLabel $period';
  }

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  Time.fromDocumentSnapshot(Map<String, dynamic> doc)
      : hour = doc['hour'],
        minute = doc['minute'];
}

class OwnerDetail {
  String name;
  File? profilePicture;

  OwnerDetail({this.name = '', this.profilePicture});

  @override
  String toString() {
    return 'OwnerDetail{name: $name, profilePicture: $profilePicture}';
  }
}

class AttendeeDetail {
  String name;
  File? profilePicture;

  AttendeeDetail({this.name = '', this.profilePicture});

  @override
  String toString() {
    return 'AttendeeDetail{name: $name, profilePicture: $profilePicture}';
  }
}
