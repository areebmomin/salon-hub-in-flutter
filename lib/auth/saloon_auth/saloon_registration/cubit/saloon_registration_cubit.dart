import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saloon_registration_state.dart';

class SaloonRegistrationCubit extends Cubit<SaloonRegistrationState> {
  SaloonRegistrationCubit() : super(SaloonRegistrationInitial());
}
