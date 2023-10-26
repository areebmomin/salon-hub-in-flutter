part of 'salon_registration_data.dart';

extension OwnerDetailsHelper on List<OwnerDetail> {
  List<String> extractNames() {
    return map((ownerDetail) => ownerDetail.name).toList();
  }

  List<File?> extractProfilePictures() {
    return map((ownerDetail) => ownerDetail.profilePicture).toList();
  }
}

extension AttendeeDetailsHelper on List<AttendeeDetail> {
  List<String> extractNames() {
    return map((attendeeDetail) => attendeeDetail.name).toList();
  }

  List<File?> extractProfilePictures() {
    return map((attendeeDetail) => attendeeDetail.profilePicture).toList();
  }
}
