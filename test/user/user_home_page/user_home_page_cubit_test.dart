import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/user/cubit/user_home_page_cubit.dart';
import '../../fakes/repositories/fake_user_home_page_repository.dart';

void main() {
  group('UserHomePageCubit', () {
    late FakeUserHomePageRepository repository;

    setUp(() {
      repository = FakeUserHomePageRepository();
    });

    test('initial state is UserHomePageCubit.Initial', () {
      expect(
        UserHomePageCubit(repository).state,
        Initial(),
      );
    });
  });
}
