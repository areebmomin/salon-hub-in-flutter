import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/user/edit_profile_page/cubit/user_edit_profile_page_cubit.dart';
import 'package:salon_hub/utils/strings.dart';
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

    group('RegisterButtonClicked', () {
      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'Do not perform action when loading',
        build: () => UserEditProfilePageCubit(repository),
        seed: () => Loading(),
        act: (cubit) {
          cubit.onSaveButtonClicked();
        },
        expect: () => [const LoadProfileData()],
      );

      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'Verify name is not empty',
        build: () => UserEditProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.userProfile.name = '';
          cubit.onSaveButtonClicked();
        },
        expect: () => [const LoadProfileData(), isA<ShowToast>()],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterName);
        },
      );

      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'Verify email is valid',
        build: () => UserEditProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.userProfile.name = 'Areeb';
          cubit.userProfile.email = 'areeb123@gmail';
          cubit.onSaveButtonClicked();
        },
        expect: () => [
          const LoadProfileData(),
          isA<ShowToast>()
        ],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterValidEmail);
        },
      );

      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'Verify address is not empty',
        build: () => UserEditProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.userProfile.name = 'Areeb';
          cubit.userProfile.email = 'areeb123@gmail.com';
          cubit.userProfile.address = '';
          cubit.onSaveButtonClicked();
        },
        expect: () => [
          const LoadProfileData(),
          isA<ShowToast>()
        ],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterAddress);
        },
      );

      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'On data updated successfully',
        build: () => UserEditProfilePageCubit(repository),
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          cubit.userProfile.name = 'Areeb';
          cubit.userProfile.email = 'areeb123@gmail.com';
          cubit.userProfile.address = 'Mumbai';
          cubit.onSaveButtonClicked();
        },
        expect: () => [
          const LoadProfileData(),
          Loading(),
          ProfileDataUpdateSuccess(),
        ],
      );

      blocTest<UserEditProfilePageCubit, UserEditProfilePageState>(
        'On data updated failed',
        build: () {
          return UserEditProfilePageCubit(repository);
        },
        act: (cubit) async {
          await Future.delayed(Duration.zero);
          repository.returnSuccess = false;
          cubit.userProfile.name = 'Areeb';
          cubit.userProfile.email = 'areeb123@gmail.com';
          cubit.userProfile.address = 'Mumbai';
          cubit.onSaveButtonClicked();
        },
        expect: () => [
          const LoadProfileData(),
          Loading(),
          isA<ShowToast>()
        ],
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.serverError);
        },
      );
    });
  });
}
