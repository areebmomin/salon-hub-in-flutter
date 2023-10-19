import 'dart:core';
import '../../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class UserHomePageSalonInfo {
  String salonId;
  String salonName;
  String salonAddress;
  List<bool> serviceDays;
  ServiceTime serviceTime;
  AvailabilityStatus availabilityStatus;
  String salonProfilePictureUrl;
  String ownerProfilePictureUrl;

  UserHomePageSalonInfo(
    this.salonId,
    this.salonName,
    this.salonAddress,
    this.serviceDays,
    this.serviceTime,
    this.availabilityStatus,
    this.salonProfilePictureUrl,
    this.ownerProfilePictureUrl,
  );

  UserHomePageSalonInfo.getDefault()
      : salonId = 'Salon Id',
        salonName = 'Salon Name',
        salonAddress = 'Address',
        serviceDays = [false, true, true, true, true, true, true],
        serviceTime = ServiceTime(),
        availabilityStatus = AvailabilityStatus.close,
        salonProfilePictureUrl = '',
        ownerProfilePictureUrl = '';

  UserHomePageSalonInfo.fromDocumentSnapshot(
    this.salonId,
    DateTime now,
    Map<String, dynamic> doc,
  )   : salonName = doc['business_name'] ?? '',
        salonAddress = doc['address'] ?? '',
        serviceDays =
            (doc['service_days'] as List).map((e) => e as bool).toList(),
        serviceTime = ServiceTime.fromDocumentSnapshot(doc['service_times']),
        availabilityStatus = AvailabilityStatus.close,
        salonProfilePictureUrl = '',
        ownerProfilePictureUrl = '' {
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
    return 'Salon id: $salonId, Salon Name: $salonName, Salon Address: $salonAddress, Availability Status: $availabilityStatus, Salon Profile Picture: $salonProfilePictureUrl, Owner Profile Picture: $ownerProfilePictureUrl';
  }
}

enum AvailabilityStatus {
  open,
  close,
}
