import 'dart:core';
import '../../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class UserHomePageSalonInfo {
  String salonId;
  String salonName;
  String salonAddress;
  List<bool> serviceDays;
  ServiceTime serviceTime;
  AvailabilityStatus availabilityStatus;

  UserHomePageSalonInfo(
    this.salonId,
    this.salonName,
    this.salonAddress,
    this.serviceDays,
    this.serviceTime,
    this.availabilityStatus,
  );

  UserHomePageSalonInfo.fromDocumentSnapshot(
    this.salonId,
    Map<String, dynamic> doc,
  )   : salonName = doc['business_name'] ?? '',
        salonAddress = doc['address'] ?? '',
        serviceDays =
            (doc['service_days'] as List).map((e) => e as bool).toList(),
        serviceTime = ServiceTime.fromDocumentSnapshot(doc['service_times']),
        availabilityStatus = AvailabilityStatus.close;

  @override
  String toString() {
    return 'Salon id: $salonId, Salon Name: $salonName, Salon Address: $salonAddress, Availability Status: $availabilityStatus';
  }
}

enum AvailabilityStatus {
  open,
  close,
}
