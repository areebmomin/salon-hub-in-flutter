import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_tab_state.dart';

class RequestTabCubit extends Cubit<RequestTabState> {
  RequestTabCubit() : super(Initial());
}
