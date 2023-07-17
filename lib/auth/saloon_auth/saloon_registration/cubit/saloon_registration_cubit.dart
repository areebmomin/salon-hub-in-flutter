import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saloon_registration_state.dart';

class SaloonRegistrationCubit extends Cubit<SaloonRegistrationState> {
  SaloonRegistrationCubit() : super(SaloonRegistrationInitial());
}
