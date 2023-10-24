import '../../../auth/salon_auth/salon_registration/models/salon_registration_data.dart';

class SalonProfileInfo {
  final String salonName;
  final String salonAddress;
  final String phoneNumber;
  final String type;
  final List<bool> serviceDays;
  final ServiceTime serviceTime;
  final List<String> services;
  String salonProfilePictureUrl;
  List<String> ownerProfilePictureUrls;
  List<String> attendeeProfilePictureUrls;
  final List<String> ownerDetails;
  final List<String> attendeeDetails;

  SalonProfileInfo.getDefault()
      : salonName = 'Salon Name',
        salonAddress = 'Address',
        phoneNumber = '',
        type = '',
        serviceDays = [false, true, true, true, true, true, true],
        serviceTime = ServiceTime(),
        services = List.empty(),
        salonProfilePictureUrl = '',
        ownerProfilePictureUrls = [],
        attendeeProfilePictureUrls = [],
        ownerDetails = List<String>.empty(),
        attendeeDetails = List<String>.empty();

  SalonProfileInfo.fromDocumentSnapshot(Map<String, dynamic> doc)
      : salonName = doc['business_name'] ?? '',
        salonAddress = doc['address'] ?? '',
        phoneNumber = doc['phone_number'] ?? '',
        type = doc['type'] ?? '',
        serviceDays =
            (doc['service_days'] as List).map((e) => e as bool).toList(),
        serviceTime = ServiceTime.fromDocumentSnapshot(doc['service_times']),
        services = (doc['services'] as List).map((e) => e as String).toList(),
        salonProfilePictureUrl = '',
        ownerProfilePictureUrls = [],
        attendeeProfilePictureUrls = [],
        ownerDetails = (doc['owner_details_list'] as List)
            .map((e) => e as String)
            .where((string) => string.isNotEmpty)
            .toList(),
        attendeeDetails = (doc['attendee_detail_list'] as List)
            .map((e) => e as String)
            .where((string) => string.isNotEmpty)
            .toList();

  @override
  String toString() {
    return 'SalonProfileInfo{salonName: $salonName, salonAddress: $salonAddress, phoneNumber: $phoneNumber, type: $type, serviceDays: $serviceDays, serviceTime: $serviceTime, services: $services, salonProfilePictureUrl: $salonProfilePictureUrl, ownerProfilePictureUrls: $ownerProfilePictureUrls, attendeeProfilePictureUrls: $attendeeProfilePictureUrls, ownerDetails: $ownerDetails, attendeeDetails: $attendeeDetails}';
  }
}
