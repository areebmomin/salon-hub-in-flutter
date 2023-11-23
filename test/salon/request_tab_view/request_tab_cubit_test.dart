import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/salon/request_tab_view/cubit/request_tab_cubit.dart';
import '../../fakes/repositories/fake_request_tab_repository.dart';

void main() {
  group('RequestTabCubit', () {
    late FakeRequestTabRepository repository;

    setUp(() {
      repository = FakeRequestTabRepository();
    });

    test('initial state is RequestTabCubit.Initial', () {
      expect(
        RequestTabCubit(repository).state,
        Loading(),
      );
    });

    group('DeclineButtonClicked', () {
      blocTest<RequestTabCubit, RequestTabState>(
        'Decline request success',
        build: () => RequestTabCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          await cubit.declineButtonClicked(0, 'Salon note');
        },
        expect: () => [isA<ShowBookingList>(), isA<ShowToast>()],
      );
    });

    group('AcceptButtonClicked', () {
      blocTest<RequestTabCubit, RequestTabState>(
        'Accept request success',
        build: () => RequestTabCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          await cubit.declineButtonClicked(0, 'Salon note');
        },
        expect: () => [isA<ShowBookingList>(), isA<ShowToast>()],
      );
    });
  });
}
