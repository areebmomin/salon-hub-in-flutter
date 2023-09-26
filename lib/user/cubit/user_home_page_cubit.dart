import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_home_page_state.dart';

class UserHomePageCubit extends Cubit<UserHomePageState> {
  UserHomePageCubit() : super(Initial());
}
