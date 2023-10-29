import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_repository.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_states.dart';
import '../../../../utils/index.dart';

part 'salon_registration_state.dart';

class SalonRegistrationCubit extends Cubit<SalonRegistrationState> {
  SalonRegistrationCubit(this._salonRegistrationRepository) : super(Initial());

  final SalonRegistrationRepository _salonRegistrationRepository;
  final data = SalonRegistrationData();
  var isPhoneNumberValid = false;

  void saveDetailsButtonClicked() {
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

  void addService(String service) {
    String text = service.substring(0, service.length - 1).trim();
    if (text.isNotEmpty) {
      data.services.add(text);
      emit(ServicesUpdated());
    }
  }

  void removeService(String service) {
    data.services.remove(service);
    emit(ServicesUpdated());
  }

  void registerNowButtonClicked() {
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

    _salonRegistrationRepository.registerSalon(data: data).listen((event) {
      if (event is Success) {
        emit(GotoSalonHomePage());
      } else if (event is Failure) {
        emit(ShowToast(message: event.message));
      }
    });
  }

  void setSalonPhoto() async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      data.profilePicture = File(pickedFile.path);
      emit(PhotoSelected(profilePicture: data.profilePicture!));
    }
  }

  void setOwnerPhoto(int index) async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      data.ownerDetailsList[index].profilePicture = File(pickedFile.path);
      emit(OwnerPhotoSelected(
        index: index,
        profilePicture: data.ownerDetailsList[index].profilePicture!,
      ));
    }
  }

  void setAttendeePhoto(int index) async {
    var pickedFile = await getPhotoFromGallery();
    if (pickedFile != null) {
      data.attendeeDetailList[index].profilePicture = File(pickedFile.path);
      emit(AttendeePhotoSelected(
        index: index,
        profilePicture: data.attendeeDetailList[index].profilePicture!,
      ));
    }
  }

  Future<XFile?> getPhotoFromGallery() =>
      ImagePicker().pickImage(source: ImageSource.gallery);

  void closeButtonClicked() {
    emit(CloseButtonClicked());
  }

  void verifyPageCloseButtonClicked() {
    emit(VerifyCloseButtonClicked());
  }

  void addNewOwner() {
    if (data.ownerDetailsList.length == 10) {
      emit(ShowToast(message: Strings.notMoreThan10Owners));
      return;
    }

    data.ownerDetailsList.add(OwnerDetail());
    emit(OwnerDetailsListUpdated());
  }

  void removeOwner(int index) {
    data.ownerDetailsList.removeAt(index);
    emit(OwnerDetailsListUpdated());
  }

  void addNewAttendee() {
    if (data.attendeeDetailList.length == 20) {
      emit(ShowToast(message: Strings.notMoreThan20Attendee));
      return;
    }

    data.attendeeDetailList.add(AttendeeDetail());
    emit(AttendeeDetailsListUpdated());
  }

  void removeAttendee(int index) {
    data.attendeeDetailList.removeAt(index);
    emit(AttendeeDetailsListUpdated());
  }
}
