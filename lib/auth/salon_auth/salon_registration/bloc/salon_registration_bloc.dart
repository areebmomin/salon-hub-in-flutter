import 'dart:async';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_repository.dart';
import '../../../../utils/strings.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_states.dart';

part 'salon_registration_event.dart';

part 'salon_registration_state.dart';

class SalonRegistrationBloc
    extends Bloc<SalonRegistrationEvent, SalonRegistrationState> {
  SalonRegistrationBloc(this._salonRegistrationRepository) : super(Initial()) {
    on<SaveDetailsButtonClicked>(_saveDetailsButtonClicked);
    on<AddService>(_addService);
    on<RemoveService>(_removeService);
    on<RegisterNowButtonClicked>(_registerNowButtonClicked);
    on<SetSalonPhoto>(_setSalonPhoto);
    on<SetOwnerPhoto>(_setOwnerPhoto);
    on<SetAttendeePhoto>(_setAttendeePhoto);
    on<CloseButtonClickedEvent>(_closeButtonClicked);
    on<VerifyPageCloseButtonClickedEvent>(_verifyPageCloseButtonClicked);
    on<AddOwner>(_addNewOwner);
    on<RemoveOwner>(_removeOwner);
    on<AddAttendee>(_addNewAttendee);
    on<RemoveAttendee>(_removeAttendee);
  }

  final SalonRegistrationRepository _salonRegistrationRepository;
  final data = SalonRegistrationData();
  var isPhoneNumberValid = false;

  void _saveDetailsButtonClicked(
    SaveDetailsButtonClicked event,
    Emitter<SalonRegistrationState> emit,
  ) {
    if (data.businessName.isEmpty) {
      emit(ShowToast(message: Strings.enterBusinessName));
      return;
    }

    if (!isPhoneNumberValid) {
      emit(ShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if (data.address.isEmpty) {
      emit(ShowToast(message: Strings.enterAddress));
      return;
    }

    if (data.services.isEmpty) {
      emit(ShowToast(message: Strings.addServices));
      return;
    }

    if (data.ownerDetailsList.first.name.isEmpty) {
      emit(ShowToast(message: Strings.addOwnerDetails));
      return;
    }

    emit(OpenVerifyPage());
  }

  void _addService(
    AddService event,
    Emitter<SalonRegistrationState> emit,
  ) {
    String text = event.service.substring(0, event.service.length - 1).trim();
    if (text.isNotEmpty) {
      data.services.add(text);
      emit(ServicesUpdated());
    }
  }

  void _removeService(
    RemoveService event,
    Emitter<SalonRegistrationState> emit,
  ) {
    data.services.remove(event.service);
    emit(ServicesUpdated());
  }

  Future<void> _registerNowButtonClicked(
    RegisterNowButtonClicked event,
    Emitter<SalonRegistrationState> emit,
  ) async {
    if (state is Loading) return;

    if (!EmailValidator.validate(data.email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (data.password.length < 6) {
      emit(ShowToast(message: Strings.enterValidPasscode));
      return;
    }

    emit(Loading());

    await _salonRegistrationRepository.registerSalon(data: data).forEach((event) {
      if (event is Success) {
        emit(GotoSalonHomePage());
      } else if (event is Failure) {
        emit(ShowToast(message: event.message));
      }
    });
  }

  void _setSalonPhoto(
    SetSalonPhoto event,
    Emitter<SalonRegistrationState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      data.profilePicture = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: data.profilePicture!));
    }
  }

  void _setOwnerPhoto(
    SetOwnerPhoto event,
    Emitter<SalonRegistrationState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      data.ownerDetailsList[event.index].profilePicture = File(pickedFile.path);
      emit(OwnerPhotoSelected(
        index: event.index,
        profilePicture: data.ownerDetailsList[event.index].profilePicture!,
      ));
    }
  }

  void _setAttendeePhoto(
    SetAttendeePhoto event,
    Emitter<SalonRegistrationState> emit,
  ) async {
    var pickedFile = await _getPhotoFromGallery();
    if (pickedFile != null) {
      data.attendeeDetailList[event.index].profilePicture =
          File(pickedFile.path);
      emit(AttendeePhotoSelected(
        index: event.index,
        profilePicture: data.attendeeDetailList[event.index].profilePicture!,
      ));
    }
  }

  Future<XFile?> _getPhotoFromGallery() =>
      ImagePicker().pickImage(source: ImageSource.gallery);

  void _closeButtonClicked(
    CloseButtonClickedEvent event,
    Emitter<SalonRegistrationState> emit,
  ) {
    emit(CloseButtonClicked());
  }

  void _verifyPageCloseButtonClicked(
    VerifyPageCloseButtonClickedEvent event,
    Emitter<SalonRegistrationState> emit,
  ) {
    emit(VerifyCloseButtonClicked());
  }

  void _addNewOwner(
    AddOwner event,
    Emitter<SalonRegistrationState> emit,
  ) {
    if (data.ownerDetailsList.length == 10) {
      emit(ShowToast(message: Strings.notMoreThan10Owners));
      return;
    }

    data.ownerDetailsList.add(OwnerDetail());
    emit(OwnerDetailsListUpdated());
  }

  void _removeOwner(
    RemoveOwner event,
    Emitter<SalonRegistrationState> emit,
  ) {
    data.ownerDetailsList.removeAt(event.index);
    emit(OwnerDetailsListUpdated());
  }

  void _addNewAttendee(
    AddAttendee event,
    Emitter<SalonRegistrationState> emit,
  ) {
    if (data.attendeeDetailList.length == 20) {
      emit(ShowToast(message: Strings.notMoreThan20Attendee));
      return;
    }

    data.attendeeDetailList.add(AttendeeDetail());
    emit(AttendeeDetailsListUpdated());
  }

  void _removeAttendee(
    RemoveAttendee event,
    Emitter<SalonRegistrationState> emit,
  ) {
    data.attendeeDetailList.removeAt(event.index);
    emit(AttendeeDetailsListUpdated());
  }
}
