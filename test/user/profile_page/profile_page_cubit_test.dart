import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/user/profile_page/cubit/user_profile_page_cubit.dart';
import '../../fakes/repositories/fake_user_profile_repository.dart';

void main() {
  group('UserProfilePageCubit', () {
    late FakeUserProfileRepository repository;

    setUp(() {
      repository = FakeUserProfileRepository();
    });

    test('initial state is UserProfilePageCubit.Initial', () {
      expect(
        UserProfilePageCubit(repository).state,
        Initial(),
      );
    });
  });
}
