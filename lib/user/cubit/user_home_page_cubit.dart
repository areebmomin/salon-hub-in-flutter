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
  final UserHomePageFilter filter = UserHomePageFilter();

  _fetchAllSalonInfo() async {
    try {
      emit(Loading());
      var salonList = await _repository.getAllSalonInfo();
      emit(ShowSalonList(salonList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }

  applyFilter() async {
    if (state is Loading) return;
    try {
      emit(Loading());
      //var salonList = await _repository.getFilteredSalonInfo();
      //emit(ShowSalonList(salonList));
    } on DatabaseException catch (e) {
      emit(ShowToast(message: e.message));
    } catch (e) {
      emit(ShowToast(message: 'An error occurred: $e'));
    }
  }
}
