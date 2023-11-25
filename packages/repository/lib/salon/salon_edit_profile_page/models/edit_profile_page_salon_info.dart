import 'dart:io';
import '../../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class EditProfilePageSalonInfo {
  String salonName;
  String salonAddress;
  String phoneNumber;
  String type;
  List<bool> serviceDays;
  ServiceTime serviceTime;
  List<String> services;
  String salonProfilePictureUrl;
  List<String> ownerProfilePictureUrls;
  List<String> attendeeProfilePictureUrls;
  List<OwnerDetail> ownerDetailsList;
  List<AttendeeDetail> attendeeDetailList;
  File? profilePicture;

  EditProfilePageSalonInfo(
    this.salonName,
    this.salonAddress,
    this.phoneNumber,
    this.type,
    this.serviceDays,
    this.serviceTime,
    this.services,
    this.salonProfilePictureUrl,
    this.ownerProfilePictureUrls,
    this.attendeeProfilePictureUrls,
    this.ownerDetailsList,
    this.attendeeDetailList,
    this.profilePicture,
  );

  EditProfilePageSalonInfo.getDefault()
      : salonName = '',
        salonAddress = '',
        phoneNumber = '',
        type = '',
        serviceDays = [false, true, true, true, true, true, true],
        serviceTime = ServiceTime(
            startTime: Time(hour: 9, minute: 0),
            endTime: Time(hour: 5, minute: 0)),
        services = List.empty(growable: true),
        salonProfilePictureUrl = '',
        ownerProfilePictureUrls = [],
        attendeeProfilePictureUrls = [],
        ownerDetailsList = [],
        attendeeDetailList = [],
        profilePicture = null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'business_name': salonName,
      'phone_number': phoneNumber,
      'address': salonAddress,
      'services': services,
      'type': type,
      'service_days': serviceDays,
      'service_times': serviceTime.toMap(),
      'owner_details_list': ownerDetailsList.extractNames(),
      'attendee_detail_list': attendeeDetailList.extractNames(),
    };
  }

  @override
  String toString() {
    return 'EditProfilePageSalonInfo{salonName: $salonName, salonAddress: $salonAddress, phoneNumber: $phoneNumber, type: $type, serviceDays: $serviceDays, serviceTime: $serviceTime, services: $services, salonProfilePictureUrl: ${salonProfilePictureUrl.length}, ownerProfilePictureUrls: $ownerProfilePictureUrls, attendeeProfilePictureUrls: $attendeeProfilePictureUrls, ownerDetailsList: $ownerDetailsList, attendeeDetailList: $attendeeDetailList, profilePicture: $profilePicture}';
  }
}
