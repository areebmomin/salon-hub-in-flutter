import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'salon_home_page_state.dart';

class SalonHomePageCubit extends Cubit<SalonHomePageState> {
  SalonHomePageCubit() : super(Initial());
}
