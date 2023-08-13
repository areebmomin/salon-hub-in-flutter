import 'dart:io';

class SaloonRegistrationData {
  File? profilePicture;
  String businessName;
  String phoneNumber;
  String address;
  String location;
  List<String> services;
  String type;
  List<bool> serviceDays;
  ServiceTime serviceTimes;
  List<OwnerDetail> ownerDetailsList;
  List<AttendeeDetail> attendeeDetailList;
  String email;
  String password;

  SaloonRegistrationData({
    this.profilePicture,
    this.businessName = '',
    this.phoneNumber = '',
    this.address = '',
    this.location = '',
    List<String>? services,
    this.type = '',
    List<bool>? serviceDays,
    ServiceTime? serviceTimes,
    List<OwnerDetail>? ownerDetailsList,
    List<AttendeeDetail>? attendeeDetailList,
    this.email = '',
    this.password = '',
  })  : services = services ?? [],
        serviceDays =
            serviceDays ?? [false, true, true, true, true, true, true],
        serviceTimes = serviceTimes ?? ServiceTime(),
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
      'service_times': serviceTimes,
      'owner_details_list': ownerDetailsList,
      'attendee_detail_list': attendeeDetailList,
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
}

class Time {
  int hour;
  int minute;

  String get period => hour < 12 ? 'AM' : 'PM';

  int get hourOfPeriod => hour == 0 || hour == 12 ? 12 : hour - periodOffset;

  int get periodOffset => period == 'AM' ? 0 : 12;

  Time({required this.hour, required this.minute});

  @override
  String toString() {
    String addLeadingZeroIfNeeded(int value) {
      return value < 10 ? '0$value' : value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hourOfPeriod);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$hourLabel:$minuteLabel $period';
  }
}

class OwnerDetail {
  String name;
  File? profilePicture;

  OwnerDetail({this.name = '', this.profilePicture});
}

class AttendeeDetail {
  String name;
  File? profilePicture;

  AttendeeDetail({this.name = '', this.profilePicture});
}
