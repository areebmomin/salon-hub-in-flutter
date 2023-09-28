import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'schedule_tab_state.dart';

class ScheduleTabCubit extends Cubit<ScheduleTabState> {
  ScheduleTabCubit() : super(Initial());
}
