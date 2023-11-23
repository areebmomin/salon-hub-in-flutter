import 'dart:core';
import '../../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class UserHomePageSalonInfo {
  final String salonId;
  final String salonName;
  final String salonAddress;
  final String phoneNumber;
  final String type;
  final List<bool> serviceDays;
  final ServiceTime serviceTime;
  final List<String> services;
  AvailabilityStatus availabilityStatus;
  String salonProfilePictureUrl;
  String ownerProfilePictureUrl;
  final List<String> ownerDetails;
  final List<String> attendeeDetails;

  UserHomePageSalonInfo(
    this.salonId,
    this.salonName,
    this.salonAddress,
    this.phoneNumber,
    this.type,
    this.serviceDays,
    this.serviceTime,
    this.services,
    this.availabilityStatus,
    this.salonProfilePictureUrl,
    this.ownerProfilePictureUrl,
    this.ownerDetails,
    this.attendeeDetails,
  );

  UserHomePageSalonInfo.getDefault()
      : salonId = 'Salon Id',
        salonName = 'Salon Name',
        salonAddress = 'Address',
        phoneNumber = '',
        type = '',
        serviceDays = [false, true, true, true, true, true, true],
        serviceTime = ServiceTime(),
        services = List.empty(),
        availabilityStatus = AvailabilityStatus.close,
        salonProfilePictureUrl = '',
        ownerProfilePictureUrl = '',
        ownerDetails = List<String>.empty(growable: true),
        attendeeDetails = List<String>.empty(growable: true);

  UserHomePageSalonInfo.fromDocumentSnapshot(
    this.salonId,
    DateTime now,
    Map<String, dynamic> doc,
  )   : salonName = doc['business_name'] ?? '',
        salonAddress = doc['address'] ?? '',
        phoneNumber = doc['phone_number'] ?? '',
        type = doc['type'] ?? '',
        serviceDays =
            (doc['service_days'] as List).map((e) => e as bool).toList(),
        serviceTime = ServiceTime.fromDocumentSnapshot(doc['service_times']),
        services = (doc['services'] as List).map((e) => e as String).toList(),
        availabilityStatus = AvailabilityStatus.close,
        salonProfilePictureUrl = '',
        ownerProfilePictureUrl = '',
        ownerDetails = (doc['owner_details_list'] as List)
            .map((e) => e as String)
            .where((string) => string.isNotEmpty)
            .toList(),
        attendeeDetails = (doc['attendee_detail_list'] as List)
            .map((e) => e as String)
            .where((string) => string.isNotEmpty)
            .toList() {
    availabilityStatus = _calculateAvailabilityStatus(now);
  }

  AvailabilityStatus _calculateAvailabilityStatus(DateTime now) {
    final isServiceDay = serviceDays[now.weekday % 7];
    return isServiceDay
        ? serviceTime.getAvailabilityStatus(now)
        : AvailabilityStatus.close;
  }

  @override
  String toString() {
    return 'Salon id: $salonId, Salon Name: $salonName, Salon Address: $salonAddress, Phone Number: $phoneNumber, Type: $type,  Availability Status: $availabilityStatus, Salon Profile Picture: $salonProfilePictureUrl, Owner Profile Picture: $ownerProfilePictureUrl';
  }
}

enum AvailabilityStatus {
  open,
  close,
}
