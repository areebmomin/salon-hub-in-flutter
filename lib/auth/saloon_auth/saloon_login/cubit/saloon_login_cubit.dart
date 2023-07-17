import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saloon_login_state.dart';

class SaloonLoginCubit extends Cubit<SaloonLoginState> {
  SaloonLoginCubit() : super(SaloonLoginInitial());
}
