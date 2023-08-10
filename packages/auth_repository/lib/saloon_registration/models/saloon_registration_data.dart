class SaloonRegistrationData {
  String businessName;
  String phoneNumber;
  String address;
  String location;
  List<String> services;
  String type;
  List<String> serviceDays;
  List<String> serviceTimes;
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
    List<String>? serviceDays,
    List<String>? serviceTimes,
    List<OwnerDetail>? ownerDetailsList,
    List<AttendeeDetail>? attendeeDetailList,
    this.email = '',
    this.password = '',
  })
      : services = services ?? [],
        serviceDays = serviceDays ?? [],
        serviceTimes = serviceTimes ?? [],
        ownerDetailsList = ownerDetailsList ?? [],
        attendeeDetailList = attendeeDetailList ?? [];

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
