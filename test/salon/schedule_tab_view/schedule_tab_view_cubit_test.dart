import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/salon/schedule_tab_view/cubit/schedule_tab_cubit.dart';
import '../../fakes/repositories/fake_schedule_tab_repository.dart';

void main() {
  group('ScheduleTabCubit', () {
    late FakeScheduleTabRepository repository;

    setUp(() {
      repository = FakeScheduleTabRepository();
    });

    test('initial state is ScheduleTabCubit.Initial', () {
      expect(
        ScheduleTabCubit(repository).state,
        Initial(),
      );
    });

    group('FetchScheduledBookingData', () {
      blocTest<ScheduleTabCubit, ScheduleTabState>(
        'Data loading failed',
        build: () => ScheduleTabCubit(repository),
        setUp: () => repository.returnSuccess = false,
        act: (cubit) {
          cubit.fetchScheduledBookings('12-09-2023');
        },
        expect: () => [Loading(), isA<ShowToast>()],
      );

      blocTest<ScheduleTabCubit, ScheduleTabState>(
        'Data loading Success',
        build: () => ScheduleTabCubit(repository),
        act: (cubit) {
          cubit.fetchScheduledBookings('12-09-2023');
        },
        expect: () => [
          Loading(),
          ShowScheduledBookingList(repository.list),
        ],
      );

      blocTest<ScheduleTabCubit, ScheduleTabState>(
        'Do not perform action when loading',
        build: () => ScheduleTabCubit(repository),
        seed: () => Loading(),
        act: (cubit) {
          cubit.fetchScheduledBookings('12-09-2023');
        },
        expect: () => [],
      );
    });
  });
}
