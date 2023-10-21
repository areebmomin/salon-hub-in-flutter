import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/book_page/book_page_repository.dart';
import 'package:repository/user/book_page/models/book_slot.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import '../../../utils/strings.dart';

part 'book_page_state.dart';

class BookPageCubit extends Cubit<BookPageState> {
  BookPageCubit(this._repository, this.salonInfo) : super(Initial()) {
    bookSlot.salonId = salonInfo.salonId;
    bookSlot.salonName = salonInfo.salonName;
  }

  final BookPageRepository _repository;
  final UserHomePageSalonInfo salonInfo;
  BookSlot bookSlot = BookSlot.getDefault();

  void bookButtonClicked() {
    if (state is Loading) return;

    if(bookSlot.services.isEmpty) {
      emit(ShowToast(message: Strings.selectServices));
      return;
    }

    emit(Loading());


  }
}
