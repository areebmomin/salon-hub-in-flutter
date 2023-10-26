import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:repository/salon/salon_edit_profile_page/salon_edit_profile_page_repository.dart';

import '../../../utils/strings.dart';

part 'salon_edit_profile_page_state.dart';

class SalonEditProfilePageCubit extends Cubit<SalonEditProfilePageState> {
  SalonEditProfilePageCubit(this._repository, this.salonInfo)
      : super(Initial());

  final SalonEditProfilePageRepository _repository;
  EditProfilePageSalonInfo salonInfo;
  bool isPhoneNumberValid = true;

  void setSalonPhoto() async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.profilePicture = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: salonInfo.profilePicture!));
    }
  }

  Future<void> saveDetailsButtonClicked() async {
    if (state is Loading) return;

    if (salonInfo.salonName.isEmpty) {
      emit(ShowToast(message: Strings.enterBusinessName));
      return;
    }

    if (!isPhoneNumberValid) {
      emit(ShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if (salonInfo.salonAddress.isEmpty) {
      emit(ShowToast(message: Strings.enterAddress));
      return;
    }

    if (salonInfo.services.isEmpty) {
      emit(ShowToast(message: Strings.addServices));
      return;
    }

    if (salonInfo.ownerDetailsList.first.name.isEmpty) {
      emit(ShowToast(message: Strings.addOwnerDetails));
      return;
    }

    emit(Loading());

    await _repository.updateSalonData(salonInfo);

    emit(ShowToast(message: Strings.dataUpdatedSuccessfully));

    emit(ProfileDataUpdateSuccess());
  }

  Future<XFile?> getPhotoFromGallery() =>
      ImagePicker().pickImage(source: ImageSource.gallery);

  void addService(String service) {
    String text = service.substring(0, service.length - 1).trim();
    if (text.isNotEmpty) {
      salonInfo.services.add(text);
      emit(ServicesUpdated());
    }
  }

  void removeService(String service) {
    salonInfo.services.remove(service);
    emit(ServicesUpdated());
  }

  void addNewOwner() {
    if (salonInfo.ownerDetailsList.length == 10) {
      emit(ShowToast(message: Strings.notMoreThan10Owners));
      return;
    }

    salonInfo.ownerDetailsList.add(OwnerDetail());
    emit(OwnerDetailsListUpdated());
  }

  void removeOwner(int index) {
    salonInfo.ownerDetailsList.removeAt(index);
    if (index < salonInfo.ownerProfilePictureUrls.length) {
      salonInfo.ownerProfilePictureUrls.removeAt(index);
    }
    emit(OwnerDetailsListUpdated());
  }

  void addNewAttendee() {
    if (salonInfo.attendeeDetailList.length == 20) {
      emit(ShowToast(message: Strings.notMoreThan20Attendee));
      return;
    }

    salonInfo.attendeeDetailList.add(AttendeeDetail());
    emit(AttendeeDetailsListUpdated());
  }

  void removeAttendee(int index) {
    salonInfo.attendeeDetailList.removeAt(index);
    if (index < salonInfo.attendeeProfilePictureUrls.length) {
      salonInfo.attendeeProfilePictureUrls.removeAt(index);
    }
    emit(AttendeeDetailsListUpdated());
  }

  void setOwnerPhoto(int index) async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.ownerDetailsList[index].profilePicture = File(pickedFile.path);
      emit(OwnerPhotoSelected(
        index: index,
        profilePicture: salonInfo.ownerDetailsList[index].profilePicture!,
      ));
    }
  }

  void setAttendeePhoto(int index) async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.attendeeDetailList[index].profilePicture =
          File(pickedFile.path);
      emit(AttendeePhotoSelected(
        index: index,
        profilePicture: salonInfo.attendeeDetailList[index].profilePicture!,
      ));
    }
  }
}
