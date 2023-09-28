import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salon_profile_page_state.dart';

class SalonProfilePageCubit extends Cubit<SalonProfilePageState> {
  SalonProfilePageCubit() : super(Initial());
}
