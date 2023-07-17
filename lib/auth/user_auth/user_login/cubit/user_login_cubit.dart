import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
}
