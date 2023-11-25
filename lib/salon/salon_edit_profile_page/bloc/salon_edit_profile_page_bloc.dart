import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:repository/salon/salon_edit_profile_page/salon_edit_profile_page_repository.dart';
import '../../../utils/strings.dart';

part 'salon_edit_profile_page_event.dart';

part 'salon_edit_profile_page_state.dart';

class SalonEditProfilePageBloc
    extends Bloc<SalonEditProfilePageEvent, SalonEditProfilePageState> {
  SalonEditProfilePageBloc(this._repository, this.salonInfo)
      : super(Initial()) {
    on<SetSalonPhoto>(_setSalonPhoto);
    on<SaveDetailsButtonClicked>(_saveDetailsButtonClicked);
    on<AddService>(_addService);
    on<RemoveService>(_removeService);
    on<AddOwner>(_addNewOwner);
    on<RemoveOwner>(_removeOwner);
    on<AddAttendee>(_addNewAttendee);
    on<RemoveAttendee>(_removeAttendee);
    on<SetOwnerPhoto>(_setOwnerPhoto);
    on<SetAttendeePhoto>(_setAttendeePhoto);
  }

  final SalonEditProfilePageRepository _repository;
  EditProfilePageSalonInfo salonInfo;
  bool isPhoneNumberValid = true;

  void _setSalonPhoto(
    SetSalonPhoto event,
    Emitter<SalonEditProfilePageState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.profilePicture = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: salonInfo.profilePicture!));
    }
  }

  Future<void> _saveDetailsButtonClicked(
    SaveDetailsButtonClicked event,
    Emitter<SalonEditProfilePageState> emit,
  ) async {
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

  Future<XFile?> _getPhotoFromGallery() =>
      ImagePicker().pickImage(source: ImageSource.gallery);

  void _addService(
    AddService event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    String text = event.service.substring(0, event.service.length - 1).trim();
    if (text.isNotEmpty) {
      salonInfo.services.add(text);
      emit(ServicesUpdated());
    }
  }

  void _removeService(
    RemoveService event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    salonInfo.services.remove(event.service);
    emit(ServicesUpdated());
  }

  void _addNewOwner(
    AddOwner event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    if (salonInfo.ownerDetailsList.length == 10) {
      emit(ShowToast(message: Strings.notMoreThan10Owners));
      return;
    }

    salonInfo.ownerDetailsList.add(OwnerDetail());
    emit(OwnerDetailsListUpdated());
  }

  void _removeOwner(
    RemoveOwner event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    salonInfo.ownerDetailsList.removeAt(event.index);
    if (event.index < salonInfo.ownerProfilePictureUrls.length) {
      salonInfo.ownerProfilePictureUrls.removeAt(event.index);
    }
    emit(OwnerDetailsListUpdated());
  }

  void _addNewAttendee(
    AddAttendee event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    if (salonInfo.attendeeDetailList.length == 20) {
      emit(ShowToast(message: Strings.notMoreThan20Attendee));
      return;
    }

    salonInfo.attendeeDetailList.add(AttendeeDetail());
    emit(AttendeeDetailsListUpdated());
  }

  void _removeAttendee(
    RemoveAttendee event,
    Emitter<SalonEditProfilePageState> emit,
  ) {
    salonInfo.attendeeDetailList.removeAt(event.index);
    if (event.index < salonInfo.attendeeProfilePictureUrls.length) {
      salonInfo.attendeeProfilePictureUrls.removeAt(event.index);
    }
    emit(AttendeeDetailsListUpdated());
  }

  void _setOwnerPhoto(
    SetOwnerPhoto event,
    Emitter<SalonEditProfilePageState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.ownerDetailsList[event.index].profilePicture =
          File(pickedFile.path);
      emit(OwnerPhotoSelected(
        index: event.index,
        profilePicture: salonInfo.ownerDetailsList[event.index].profilePicture!,
      ));
    }
  }

  void _setAttendeePhoto(
    SetAttendeePhoto event,
    Emitter<SalonEditProfilePageState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      salonInfo.attendeeDetailList[event.index].profilePicture =
          File(pickedFile.path);
      emit(AttendeePhotoSelected(
        index: event.index,
        profilePicture:
            salonInfo.attendeeDetailList[event.index].profilePicture!,
      ));
    }
  }
}
