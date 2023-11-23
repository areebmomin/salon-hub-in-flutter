import 'package:bloc_test/bloc_test.dart';
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

    group('LoadDataOnStart', () {
      blocTest<SalonProfilePageCubit, SalonProfilePageState>(
        'Data loading failed',
        build: () => SalonProfilePageCubit(repository),
        setUp: () => repository.returnSuccess = false,
        expect: () => [isA<ShowToast>()],
      );

      blocTest<SalonProfilePageCubit, SalonProfilePageState>(
        'Data loading Success',
        build: () => SalonProfilePageCubit(repository),
        expect: () => [
          isA<LoadSalonProfile>(),
          isA<LoadOwnerProfilePicture>(),
          isA<LoadAttendeeProfilePicture>(),
        ],
      );
    });

    group('SalonEditProfilePage', () {
      blocTest<SalonProfilePageCubit, SalonProfilePageState>(
        'Navigate to Salon Edit Profile page',
        build: () => SalonProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.gotoSalonEditProfilePage();
        },
        expect: () => [
          isA<LoadSalonProfile>(),
          isA<LoadOwnerProfilePicture>(),
          isA<LoadAttendeeProfilePicture>(),
          isA<GotoEditProfilePage>()
        ],
      );
    });

    group('Logout', () {
      blocTest<SalonProfilePageCubit, SalonProfilePageState>(
        'Logout user',
        build: () => SalonProfilePageCubit(repository),
      );
    });
  });
}
