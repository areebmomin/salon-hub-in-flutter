import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/user/book_page/book_page_repository.dart';
import 'package:repository/user/book_page/models/book_slot.dart';

part 'book_page_state.dart';

class BookPageCubit extends Cubit<BookPageState> {
  BookPageCubit(this._repository) : super(Initial());

  final BookPageRepository _repository;
  BookSlot bookSlot = BookSlot.getDefault();

  void bookButtonClicked() {
    debugPrint(bookSlot.toString());
  }
}
