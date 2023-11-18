import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/auth/user_auth/user_login/cubit/user_login_cubit.dart';
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
  });
}