import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/auth/user_auth/user_registration/cubit/user_registration_cubit.dart';
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
  });
}
