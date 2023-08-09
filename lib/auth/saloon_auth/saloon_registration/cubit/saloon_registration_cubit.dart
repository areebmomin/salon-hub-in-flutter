import 'dart:io';
import 'package:auth_repository/saloon_registration/saloon_registration_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'saloon_registration_state.dart';

class SaloonRegistrationCubit extends Cubit<SaloonRegistrationState> {
  SaloonRegistrationCubit(this.saloonRegistrationRepository)
      : super(SaloonRegistrationInitial());

  final SaloonRegistrationRepository saloonRegistrationRepository;
  File? _imageFile;

  void getPhotoFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      emit(SaloonRegistrationPhotoSelected(profilePicture: _imageFile!));
    }
  }
}
