import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/salon/salon_profile_page/models/salon_profile_info.dart';
import 'package:repository/salon/salon_profile_page/salon_profile_page_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'salon_profile_page_state.dart';

class SalonProfilePageCubit extends Cubit<SalonProfilePageState> {
  SalonProfilePageCubit(this._repository) : super(Initial()) {
    _fetchSalonProfileInfo();
  }

  final SalonProfilePageRepository _repository;
  SalonProfileInfo salonProfileInfo = SalonProfileInfo.getDefault();

  void _fetchSalonProfileInfo() async {
    try {
      var salonInfo = await _repository.getSalonProfile();
      salonProfileInfo = salonInfo;
      emit(const LoadSalonProfile());

      _fetchAllOwnerProfilePictureUrls();
      _fetchAllAttendeeProfilePictureUrls();
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  Future<void> _fetchAllOwnerProfilePictureUrls() async {
    final futures = <Future<String>>[];
    salonProfileInfo.ownerDetails.asMap().forEach((key, value) {
      final future = _repository.fetchOwnerProfileUrl(key);
      futures.add(future);
    });

    final urls = await Future.wait(futures);
    salonProfileInfo.ownerProfilePictureUrls.addAll(urls);
    emit(const LoadOwnerProfilePicture());
  }

  Future<void> _fetchAllAttendeeProfilePictureUrls() async {
    final futures = <Future<String>>[];
    salonProfileInfo.attendeeDetails.asMap().forEach((key, value) {
      final future = _repository.fetchAttendeeProfileUrl(key);
      futures.add(future);
    });

    final urls = await Future.wait(futures);
    salonProfileInfo.attendeeProfilePictureUrls.addAll(urls);
    emit(const LoadAttendeeProfilePicture());
  }

  Future<void> logout() async {
    await _repository.logout();
    emit(GotoLoginPage());
  }

  void gotoSalonEditProfilePage() {
    emit(GotoEditProfilePage());
  }
}
