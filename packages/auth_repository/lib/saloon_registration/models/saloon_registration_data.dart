class SaloonRegistrationData {
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
      : startTime = startTime ?? Time(hours: '10', minute: '00', period: 'AM'),
        endTime = endTime ?? Time(hours: '20', minute: '00', period: 'PM');
}

class Time {
  String hours;
  String minute;
  String period;

  Time({required this.hours, required this.minute, required this.period});

  void updateTime(String hours, String minute, String period) {
    this.hours = hours;
    this.minute = minute;
    this.period = period;
  }
}

class OwnerDetail {
  String name;
  String photo;

  OwnerDetail({this.name = '', this.photo = ''});
}

class AttendeeDetail {
  String name;
  String photo;

  AttendeeDetail({this.name = '', this.photo = ''});
}
