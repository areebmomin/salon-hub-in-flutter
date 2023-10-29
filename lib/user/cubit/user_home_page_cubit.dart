import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/user_home_page/models/user_home_page_filter.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:repository/utils/exceptions/database_exception.dart';
import '../../utils/strings.dart';

part 'user_home_page_state.dart';

class UserHomePageCubit extends Cubit<UserHomePageState> {
  UserHomePageCubit(this._repository) : super(Initial()) {
    _fetchAllSalonInfo();
  }

  final UserHomePageRepository _repository;
  final UserHomePageFilter filter = UserHomePageFilter();
  final List<UserHomePageSalonInfo> salonList = List.empty(growable: true);
  final UserProfile userProfile = UserProfile();

  void _fetchAllSalonInfo() async {
    try {
      emit(Loading());
      final results = await Future.wait([
        _repository.getUserProfile(),
        _repository.getAllSalonInfo(),
      ]);
      userProfile.copy(results[0] as UserProfile);
      var salonListResponse = results[1] as List<UserHomePageSalonInfo>;
      salonList.addAll(salonListResponse);
      emit(ShowSalonList(salonListResponse));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  void applyFilter() {
    if (state is Loading) return;
    emit(Loading());
    var salonListResult = salonList.where((salon) {
      final filterName = filter.salonName.toLowerCase();
      final filterAddress = filter.address.toLowerCase();
      final filterAvailability = filter.salonAvailability;

      if (filterName.isNotEmpty &&
          !salon.salonName.toLowerCase().contains(filterName)) {
        return false;
      }

      if (filterAvailability != 0 &&
          salon.availabilityStatus.name !=
              Strings.salonAvailability[filterAvailability].toLowerCase()) {
        return false;
      }

      if (filterAddress.isNotEmpty &&
          !salon.salonAddress.toLowerCase().contains(filterAddress)) {
        return false;
      }

      return true;
    }).toList();
    emit(ShowSalonList(salonListResult));
  }
}
