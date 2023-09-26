import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_salon_page_state.dart';

class AboutSalonPageCubit extends Cubit<AboutSalonPageState> {
  AboutSalonPageCubit() : super(Initial());
}
