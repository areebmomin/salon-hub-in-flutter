import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/salon/salon_profile_page/cubit/salon_profile_page_cubit.dart';
import '../../fakes/repositories/fake_salon_profile_page_repository.dart';

void main() {
  group('SalonProfilePageCubit', () {
    late FakeSalonProfilePageRepository repository;

    setUp(() {
      repository = FakeSalonProfilePageRepository();
    });

    test('initial state is SalonProfilePageCubit.Initial', () {
      expect(
        SalonProfilePageCubit(repository).state,
        Initial(),
      );
    });
  });
}
