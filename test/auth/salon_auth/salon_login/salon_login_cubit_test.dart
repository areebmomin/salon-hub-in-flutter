import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/auth/salon_auth/salon_login/cubit/salon_login_cubit.dart';
import 'package:salon_hub/utils/strings.dart';
import '../../../fakes/repositories/salon_login_repository.dart';

void main() {
  group('SalonLoginCubit', () {
    late FakeSalonLoginRepository repository;

    setUp(() {
      repository = FakeSalonLoginRepository();
    });

    test('initial state is SalonLoginCubit.Initial', () {
      expect(
        SalonLoginCubit(repository).state,
        Initial(),
      );
    });

    group('LoginButtonClicked', () {
      blocTest<SalonLoginCubit, SalonLoginState>(
        'Do not perform action when loading',
        build: () => SalonLoginCubit(repository),
        seed: () => Loading(),
        act: (cubit) => cubit.loginButtonClicked(),
        expect: () => [],
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Show toast when email is not valid',
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test';
          cubit.loginButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidEmail);
        },
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Show toast when password is not valid',
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test@gmail.com';
          cubit.password = '123';
          cubit.loginButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidPasscode);
        }
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Return success when Login is successful',
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test@gmail.com';
          cubit.password = '123456';
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), Success()],
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Return Failure when Login is not successful',
        setUp: () => repository.returnSuccess = false,
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test@gmail.com';
          cubit.password = '123456';
          cubit.loginButtonClicked();
        },
        expect: () => [Loading(), Failure(), isA<ShowToast>()],
      );
    });

    group('ForgotPasscodeButtonClicked', () {
      blocTest<SalonLoginCubit, SalonLoginState>(
        'Show toast when email is not valid',
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test';
          cubit.forgotPasscodeButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidEmail);
        },
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Return success when forgot password email is sent successfully',
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test@gmail.com';
          cubit.forgotPasscodeButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.resetEmailLinkSent);
        },
      );

      blocTest<SalonLoginCubit, SalonLoginState>(
        'Return Failure when forgot password email is not sent successfully',
        setUp: () => repository.returnSuccess = false,
        build: () => SalonLoginCubit(repository),
        act: (cubit) {
          cubit.email = 'test@gmail.com';
          cubit.forgotPasscodeButtonClicked();
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, 'Exception: Passcode reset failed');
        },
      );
    });
  });
}
