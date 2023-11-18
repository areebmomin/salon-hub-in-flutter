import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/user/edit_profile_page/cubit/user_edit_profile_page_cubit.dart';
import '../../fakes/repositories/fake_edit_user_profile_page_repository.dart';

void main() {
  group('UserEditProfilePageCubit', () {
    late FakeEditUserProfilePageRepository repository;

    setUp(() {
      repository = FakeEditUserProfilePageRepository();
    });

    test('initial state is UserEditProfilePageCubit.Initial', () {
      expect(
        UserEditProfilePageCubit(repository).state,
        Initial(),
      );
    });
  });
}
