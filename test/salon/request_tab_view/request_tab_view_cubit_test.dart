import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/salon/request_tab_view/cubit/request_tab_cubit.dart';
import '../../fakes/repositories/fake_request_tab_view_repository.dart';

void main() {
  group('RequestTabCubit', () {
    late FakeRequestTabViewRepository repository;

    setUp(() {
      repository = FakeRequestTabViewRepository();
    });

    test('initial state is RequestTabCubit.Initial', () {
      expect(
        RequestTabCubit(repository).state,
        Initial(),
      );
    });
  });
}
