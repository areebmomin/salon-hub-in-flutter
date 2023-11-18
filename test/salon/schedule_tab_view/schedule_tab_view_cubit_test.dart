import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/salon/schedule_tab_view/cubit/schedule_tab_cubit.dart';
import '../../fakes/repositories/fake_schedule_tab_view_repository.dart';

void main() {
  group('ScheduleTabCubit', () {
    late FakeScheduleTabViewRepository repository;

    setUp(() {
      repository = FakeScheduleTabViewRepository();
    });

    test('initial state is ScheduleTabCubit.Initial', () {
      expect(
        ScheduleTabCubit(repository).state,
        Initial(),
      );
    });
  });
}
