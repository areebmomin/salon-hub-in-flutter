part of 'salon_registration_data.dart';

extension on List<OwnerDetail> {
  List<String> extractNames() {
    return map((ownerDetail) => ownerDetail.name).toList();
  }
}

extension on List<AttendeeDetail> {
  List<String> extractNames() {
    return map((attendeeDetail) => attendeeDetail.name).toList();
  }
}
