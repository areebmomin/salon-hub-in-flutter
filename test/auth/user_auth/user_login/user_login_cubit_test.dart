import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/auth/user_auth/user_login/user_login_repository.dart';
import 'package:salon_hub/auth/user_auth/user_login/cubit/user_login_cubit.dart';
import 'package:salon_hub/utils/strings.dart';
import '../../../fakes/repositories/fake_user_login_repository.dart';

void main() {
  group('UserLoginCubit', () {
    late FakeUserLoginRepository repository;

    setUp(() {
      repository = FakeUserLoginRepository();
    });

    test('initial state is UserLoginCubit.Initial', () {
      expect(
        UserLoginCubit(repository).state,
        Initial(),
      );
    });

    group('LoginButtonClicked', () {
      blocTest<UserLoginCubit, UserLoginState>(
        'Do not perform action when loading',
        build: () => UserLoginCubit(repository),
        seed: () => Loading(),
        act: (cubit) => cubit.loginButtonClicked(),
        expect: () => [],
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Check for invalid phone number',
        build: () => UserLoginCubit(repository),
        act: (cubit) {
          cubit.phoneNumber = '+91 912088736';
          cubit.isPhoneNumberValid = false;
          cubit.loginButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidPhoneNumber);
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify phone number failed case',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberFailed,
        act: (cubit) {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), isA<ShowToast>()],
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, 'Verification failed');
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify phone number code sent case',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberCodeSent,
        act: (cubit) {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), OtpSent()],
        verify: (cubit) {
          cubit.isOtpSent == true;
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify phone number OTP timeout case',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberTimeout,
        act: (cubit) {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), OtpTimeout(), isA<ShowToast>()],
        verify: (cubit) {
          cubit.isOtpSent == false;
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.otpTimeout);
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify phone number Completed case',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberCompleted,
        act: (cubit) {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), Success()],
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Check for invalid OTP',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberCodeSent,
        act: (cubit) async {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.otp = '123';
          cubit.loginButtonClicked();
          await Future.delayed(Duration.zero);
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), OtpSent(), isA<ShowToast>()],
        verify: (cubit) {
          cubit.isOtpSent == true;
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidOtp);
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify OTP failed case',
        build: () => UserLoginCubit(repository),
        setUp: () {
          repository.verifyPhoneNumberState = VerifyPhoneNumberCodeSent;
          repository.returnSuccess = false;
        },
        act: (cubit) async {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.otp = '123456';
          cubit.loginButtonClicked();
          await Future.delayed(Duration.zero);
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), OtpSent(), Loading(), isA<ShowToast>()],
        verify: (cubit) {
          cubit.isOtpSent == true;
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, 'Verification failed');
        },
      );

      blocTest<UserLoginCubit, UserLoginState>(
        'Handle verify OTP success case',
        build: () => UserLoginCubit(repository),
        setUp: () =>
            repository.verifyPhoneNumberState = VerifyPhoneNumberCodeSent,
        act: (cubit) async {
          cubit.phoneNumber = '+91 9120887363';
          cubit.isPhoneNumberValid = true;
          cubit.otp = '123456';
          cubit.loginButtonClicked();
          await Future.delayed(Duration.zero);
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), OtpSent(), Loading(), Success()],
      );
    });
  });
}
