import 'package:auth_repository/saloon_login/saloon_login_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';

part 'saloon_login_state.dart';

class SaloonLoginCubit extends Cubit<SaloonLoginState> {
  SaloonLoginCubit(this._saloonLoginRepository) : super(SaloonLoginInitial());

  final SaloonLoginRepository _saloonLoginRepository;
  var _email = '';
  var _password = '';

  set email(String email) => _email = email;

  set password(String password) => _password = password;

  Future<void> loginButtonClicked() async {
    if (state is SaloonLoginLoading) return;

    if (!EmailValidator.validate(_email)) {
      emit(SaloonLoginShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (_password.length < 6) {
      emit(SaloonLoginShowToast(message: Strings.enterValidPasscode));
      return;
    }

    emit(SaloonLoginLoading());

    try {
      await _saloonLoginRepository.loginWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      emit(SaloonLoginSuccess());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(SaloonLoginFailure());
      emit(SaloonLoginShowToast(message: e.message));
    }
  }

  void forgotPasscodeButtonClicked() async {
    if (!EmailValidator.validate(_email)) {
      emit(SaloonLoginShowToast(message: Strings.enterValidEmail));
      return;
    }

    try {
      await _saloonLoginRepository.sendPasswordResetEmail(email: _email);
      emit(SaloonLoginShowToast(message: Strings.resetEmailLinkSent));
    } catch (e) {
      emit(SaloonLoginShowToast(message: e.toString()));
    }
  }
}
