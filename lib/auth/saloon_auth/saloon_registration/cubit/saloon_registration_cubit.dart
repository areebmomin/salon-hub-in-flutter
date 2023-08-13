import 'dart:io';
import 'package:auth_repository/saloon_registration/models/saloon_registration_data.dart';
import 'package:auth_repository/saloon_registration/saloon_registration_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/index.dart';

part 'saloon_registration_state.dart';

class SaloonRegistrationCubit extends Cubit<SaloonRegistrationState> {
  SaloonRegistrationCubit(this.saloonRegistrationRepository)
      : super(SaloonRegistrationInitial());

  final SaloonRegistrationRepository saloonRegistrationRepository;
  final data = SaloonRegistrationData();
  var isPhoneNumberValid = false;

  void saveDetailsButtonClicked() {
    if (data.businessName.isEmpty) {
      emit(SaloonRegistrationShowToast(message: Strings.enterBusinessName));
      return;
    }

    if (!isPhoneNumberValid) {
      emit(SaloonRegistrationShowToast(message: Strings.enterValidPhoneNumber));
      return;
    }

    if (data.address.isEmpty) {
      emit(SaloonRegistrationShowToast(message: Strings.enterAddress));
      return;
    }

    if (data.services.isEmpty) {
      emit(SaloonRegistrationShowToast(message: Strings.addServices));
      return;
    }

    if (data.ownerDetailsList.first.name.isEmpty) {
      emit(SaloonRegistrationShowToast(message: Strings.addOwnerDetails));
      return;
    }

    emit(SaloonRegistrationOpenVerifyPage());
  }

  void addService(String service) {
    String text = service.substring(0, service.length - 1).trim();
    if (text.isNotEmpty) {
      data.services.add(text);
      emit(SaloonRegistrationServicesUpdated());
    }
  }

  void removeService(String service) {
    data.services.remove(service);
    emit(SaloonRegistrationServicesUpdated());
  }

  void registerNowButtonClicked() {
    emit(SaloonRegistrationGotoSaloonHomePage());
  }

  void getPhotoFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      data.profilePicture = File(pickedFile.path);
      emit(SaloonRegistrationPhotoSelected(profilePicture: data.profilePicture!));
    }
  }

  void saloonRegistrationPageCloseButtonClicked() {
    emit(SaloonRegistrationCloseButtonClicked());
  }

  void saloonRegistrationVerifyPageCloseButtonClicked() {
    emit(SaloonRegistrationVerifyCloseButtonClicked());
  }
}
