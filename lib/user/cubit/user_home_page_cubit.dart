import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/user_home_page/models/user_home_page_filter.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_home_page/user_home_page_repository.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

part 'user_home_page_state.dart';

class UserHomePageCubit extends Cubit<UserHomePageState> {
  UserHomePageCubit(this._repository) : super(Initial()) {
    _fetchAllSalonInfo();
  }

  final UserHomePageRepository _repository;
  final UserHomePageFilter filter = UserHomePageFilter(salonName: 'bea');
  final List<UserHomePageSalonInfo> salonList = List.empty(growable: true);

  void _fetchAllSalonInfo() async {
    try {
      emit(Loading());
      var salonListResponse = await _repository.getAllSalonInfo();
      salonList.addAll(salonListResponse);
      emit(ShowSalonList(salonListResponse));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  Future<void> applyFilter() async {
    await Future.delayed(Duration(seconds: 4));
    if (state is Loading) return;
    emit(Loading());
    var salonListResult = salonList.where((salon) {
      final filterName = filter.salonName.toLowerCase();
      final filterLocation = filter.location.toLowerCase();
      final filterAddress = filter.address.toLowerCase();

      if (filterName.isNotEmpty &&
          !salon.salonName.toLowerCase().contains(filterName)) {
        return false;
      }

      if (filter.salonAvailability.isNotEmpty &&
          salon.availabilityStatus.toString() != filter.salonAvailability) {
        return false;
      }

      if (filterLocation.isNotEmpty &&
          !salon.salonAddress.toLowerCase().contains(filterLocation)) {
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
