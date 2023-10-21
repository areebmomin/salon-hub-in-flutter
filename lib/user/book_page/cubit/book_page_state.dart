part of 'book_page_cubit.dart';

abstract class BookPageState extends Equatable {
  const BookPageState();
}

class Initial extends BookPageState {
  @override
  List<Object> get props => [];
}

class Loading extends BookPageState {
  @override
  List<Object> get props => [];
}

class ShowToast extends BookPageState {
  final String message;

  ShowToast({required this.message});

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
