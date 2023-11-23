import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
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
        Loading(),
      );
    });

    group('LoadDataOnStart', () {
      blocTest<UserHomePageCubit, UserHomePageState>(
        'Data loading failed',
        build: () => UserHomePageCubit(repository),
        setUp: () => repository.returnSuccess = false,
        expect: () => [isA<ShowToast>()],
      );

      blocTest<UserHomePageCubit, UserHomePageState>(
        'Data loading Success',
        build: () => UserHomePageCubit(repository),
        expect: () => [isA<ShowSalonList>()],
      );
    });

    group('ApplyFilter', () {
      blocTest<UserHomePageCubit, UserHomePageState>(
        'Filter by name',
        build: () => UserHomePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.filter.salonName = 'Beauty Salon';
          cubit.applyFilter();
        },
        expect: () => [ShowSalonList(repository.list), Loading(), ShowSalonList([repository.list.first])],
      );

      blocTest<UserHomePageCubit, UserHomePageState>(
        'Filter by name and availability',
        build: () => UserHomePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.filter.salonName = 'Beardo Salon';
          cubit.filter.salonAvailability = 2;
          cubit.applyFilter();
        },
        expect: () => [ShowSalonList(repository.list), Loading(), ShowSalonList([repository.list[1]])],
      );

      blocTest<UserHomePageCubit, UserHomePageState>(
        'Filter by name, availability and address',
        build: () => UserHomePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.filter.salonName = 'Scissors Salon';
          cubit.filter.salonAvailability = 2;
          cubit.filter.address = 'Bangalore';
          cubit.applyFilter();
        },
        expect: () => [ShowSalonList(repository.list), Loading(), ShowSalonList([repository.list.last])],
      );

      blocTest<UserHomePageCubit, UserHomePageState>(
        'Do not perform action when loading',
        build: () => UserHomePageCubit(repository),
        seed: () => Loading(),
        act: (cubit) async {
          cubit.applyFilter();
        },
        expect: () => [isA<ShowSalonList>()],
      );
    });
  });
}
