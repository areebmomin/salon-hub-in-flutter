import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_page_state.dart';

class BookPageCubit extends Cubit<BookPageState> {
  BookPageCubit() : super(Initial());
}
