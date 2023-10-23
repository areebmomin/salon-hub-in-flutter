import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/about_salon_page/about_salon_page_repository.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';

part 'about_salon_page_state.dart';

class AboutSalonPageCubit extends Cubit<AboutSalonPageState> {
  AboutSalonPageCubit(this._repository, this.salonInfo) : super(Initial()) {
    _fetchAllOwnerProfilePictureUrls();
    _fetchAllAttendeeProfilePictureUrls();
  }

  final AboutSalonPageRepository _repository;
  final UserHomePageSalonInfo salonInfo;
  final List<String> ownerProfilePictureUrls = [];
  final List<String> attendeeProfilePictureUrls = [];

  Future<void> _fetchAllOwnerProfilePictureUrls() async {
    final futures = <Future<String>>[];
    salonInfo.ownerDetails.asMap().forEach((key, value) {
      final future = _repository.fetchOwnerProfileUrl(salonInfo.salonId, key);
      futures.add(future);
    });

    final urls = await Future.wait(futures);
    ownerProfilePictureUrls.addAll(urls);
    emit(const LoadOwnerProfilePicture());
  }

  Future<void> _fetchAllAttendeeProfilePictureUrls() async {
    final futures = <Future<String>>[];
    salonInfo.attendeeDetails.asMap().forEach((key, value) {
      final future =
          _repository.fetchAttendeeProfileUrl(salonInfo.salonId, key);
      futures.add(future);
    });

    final urls = await Future.wait(futures);
    attendeeProfilePictureUrls.addAll(urls);
    emit(const LoadAttendeeProfilePicture());
  }
}
