import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salon_edit_profile_page_state.dart';

class SalonEditProfilePageCubit extends Cubit<SalonEditProfilePageState> {
  SalonEditProfilePageCubit() : super(Initial());
}
