import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/auth/user_auth/user_login/user_login_repository.dart';
import 'package:salon_hub/auth/user_auth/user_registration/cubit/user_registration_cubit.dart';
import 'package:salon_hub/utils/strings.dart';
import '../../../fakes/repositories/fake_user_login_repository.dart';
import '../../../fakes/repositories/fake_user_registration_repository.dart';

void main() {
  group('UserRegistrationCubit', () {
    late FakeUserLoginRepository userLoginRepository;
    late FakeUserRegistrationRepository userRegistrationRepository;

    setUp(() {
      userLoginRepository = FakeUserLoginRepository();
      userRegistrationRepository = FakeUserRegistrationRepository();
    });

    test('initial state is UserRegistrationCubit.Initial', () {
      expect(
        UserRegistrationCubit(userLoginRepository, userRegistrationRepository)
            .state,
        Initial(),
      );
    });

    group('RegisterButtonCLicked', () {
      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Do not perform action when loading',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        seed: () => Loading(),
        act: (cubit) => cubit.onRegisterButtonCLicked(),
        expect: () => [],
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify name is not empty',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.data.name = '';
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterName);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify phone number is valid',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = false;
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterValidPhoneNumber);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify email is valid',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail';
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterValidEmail);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify address is not empty',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = '';
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterAddress);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify terms and condition is accepted',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = 'Mumbai';
          cubit.isTermsAndConditionAccepted = false;
          cubit.onRegisterButtonCLicked();
        },
        expect: () =>
            [const TermsAndCondition(isChecked: false), isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.acceptTermsAndCondition);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'On verification phone number completed',
        build: () {
          userLoginRepository.verifyPhoneNumberState =
              VerifyPhoneNumberCompleted;
          return UserRegistrationCubit(
              userLoginRepository, userRegistrationRepository);
        },
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = 'Mumbai';
          cubit.isTermsAndConditionAccepted = true;
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [const TermsAndCondition(isChecked: true), Loading(), GotoUserHomePage()],
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'On verification phone number failed',
        build: () {
          userLoginRepository.verifyPhoneNumberState =
              VerifyPhoneNumberFailed;
          return UserRegistrationCubit(
              userLoginRepository, userRegistrationRepository);
        },
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = 'Mumbai';
          cubit.isTermsAndConditionAccepted = true;
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [const TermsAndCondition(isChecked: true), Loading(), isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, 'Verification failed');
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'On verification phone number code sent',
        build: () {
          userLoginRepository.verifyPhoneNumberState =
              VerifyPhoneNumberCodeSent;
          return UserRegistrationCubit(
              userLoginRepository, userRegistrationRepository);
        },
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = 'Mumbai';
          cubit.isTermsAndConditionAccepted = true;
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [const TermsAndCondition(isChecked: true), Loading(), OpenOtpPage()],
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'On verification phone number time out',
        build: () {
          userLoginRepository.verifyPhoneNumberState =
              VerifyPhoneNumberTimeout;
          return UserRegistrationCubit(
              userLoginRepository, userRegistrationRepository);
        },
        act: (cubit) {
          cubit.data.name = 'Areeb';
          cubit.data.isPhoneNumberValid = true;
          cubit.data.email = 'areeb123@gmail.com';
          cubit.data.address = 'Mumbai';
          cubit.isTermsAndConditionAccepted = true;
          cubit.onRegisterButtonCLicked();
        },
        expect: () => [const TermsAndCondition(isChecked: true), Loading(), isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.otpTimeout);
        },
      );
    });

    group('SubmitButtonClicked', () {
      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Do not perform action when loading',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        seed: () => OtpLoading(),
        act: (cubit) => cubit.onSubmitButtonClicked(),
        expect: () => [],
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Verify name is not empty',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.otp = '123';
          cubit.onSubmitButtonClicked();
        },
        expect: () => [isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterOtp);
        },
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Return success when Login is successful',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.otp = '123456';
          cubit.onSubmitButtonClicked();
        },
        expect: () => [OtpLoading(), GotoUserHomePage()],
      );

      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Return Failure when Login is not successful',
        setUp: () => userLoginRepository.returnSuccess = false,
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.otp = '123456';
          cubit.onSubmitButtonClicked();
        },
        expect: () => [OtpLoading(), isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, 'Verification failed');
        },
      );
    });

    group('CloseButtonClicked', () {
      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Close button clicked',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.closeButtonClicked();
        },
        expect: () => [CloseButtonClicked()],
      );
    });

    group('OtpPageCloseButtonClicked', () {
      blocTest<UserRegistrationCubit, UserRegistrationState>(
        'Otp page close button clicked',
        build: () => UserRegistrationCubit(
            userLoginRepository, userRegistrationRepository),
        act: (cubit) {
          cubit.otpPageCloseButtonClicked();
        },
        expect: () => [OtpCloseButtonClicked()],
      );
    });
  });
}
