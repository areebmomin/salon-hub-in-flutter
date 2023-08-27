import 'package:auth_repository/saloon_login/saloon_login_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/strings.dart';

part 'saloon_login_state.dart';

class SaloonLoginCubit extends Cubit<SaloonLoginState> {
  SaloonLoginCubit(this._saloonLoginRepository) : super(Initial());

  final SaloonLoginRepository _saloonLoginRepository;
  var _email = '';
  var _password = '';

  set email(String email) => _email = email;

  set password(String password) => _password = password;

  Future<void> loginButtonClicked() async {
    if (state is Loading) return;

    if (!EmailValidator.validate(_email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    if (_password.length < 6) {
      emit(ShowToast(message: Strings.enterValidPasscode));
      return;
    }

    emit(Loading());

    try {
      await _saloonLoginRepository.loginWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      emit(Success());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(Failure());
      emit(ShowToast(message: e.message));
    }
  }

  void forgotPasscodeButtonClicked() async {
    if (!EmailValidator.validate(_email)) {
      emit(ShowToast(message: Strings.enterValidEmail));
      return;
    }

    try {
      await _saloonLoginRepository.sendPasswordResetEmail(email: _email);
      emit(ShowToast(message: Strings.resetEmailLinkSent));
    } catch (e) {
      emit(ShowToast(message: e.toString()));
    }
  }
}
