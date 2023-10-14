import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';

part 'user_home_page_state.dart';

class UserHomePageCubit extends Cubit<UserHomePageState> {
  UserHomePageCubit(this._repository) : super(Initial()) {
    _fetchAllSalonInfo();
  }

  final UserHomePageRepository _repository;

  _fetchAllSalonInfo() {
    _repository.getAllSalonInfo();
  }

  Future<String> getSalonProfilePicture(String salonId) async {
    return await _repository.getSalonProfilePictureUrl(salonId);
  }

  Future<String> getOwnerProfilePicture(String salonId) async {
    return await _repository.getSalonOwnerProfilePictureUrl(salonId);
  }
}
