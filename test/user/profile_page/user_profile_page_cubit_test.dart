import 'package:bloc_test/bloc_test.dart';
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

    group('LoadDataOnStart', () {
      blocTest<UserProfilePageCubit, UserProfilePageState>(
        'Data loading failed',
        build: () => UserProfilePageCubit(repository),
        setUp: () => repository.returnSuccess = false,
        expect: () => [isA<ShowToast>(), isA<ShowToast>()],
      );

      blocTest<UserProfilePageCubit, UserProfilePageState>(
        'Data loading Success',
        build: () => UserProfilePageCubit(repository),
        expect: () => [
          isA<LoadUserProfile>(),
          isA<LoadBookingHistory>(),
        ],
      );
    });

    group('UserEditProfilePage', () {
      blocTest<UserProfilePageCubit, UserProfilePageState>(
        'Navigate to User Edit Profile page',
        build: () => UserProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.gotoUserEditProfilePage();
        },
        expect: () => [
          isA<LoadUserProfile>(),
          isA<LoadBookingHistory>(),
          isA<GotoEditProfilePage>(),
        ],
      );
    });

    group('Logout', () {
      blocTest<UserProfilePageCubit, UserProfilePageState>(
        'Logout user',
        build: () => UserProfilePageCubit(repository),
      );
    });
  });
}
