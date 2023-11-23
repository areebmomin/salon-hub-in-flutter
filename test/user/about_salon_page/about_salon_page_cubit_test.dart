import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:salon_hub/user/about_salon_page/cubit/about_salon_page_cubit.dart';
import '../../fakes/repositories/fake_about_salon_page_repository.dart';

void main() {
  group('AboutSalonPageCubit', () {
    late FakeAboutSalonPageRepository repository;
    var userHomePageSalonInfo = UserHomePageSalonInfo.getDefault();

    setUp(() {
      userHomePageSalonInfo.ownerDetails.add('Areeb');
      userHomePageSalonInfo.attendeeDetails.add('Areeb');
      repository = FakeAboutSalonPageRepository();
    });

    test('initial state is AboutSalonPageCubit.Initial', () {
      expect(
        AboutSalonPageCubit(repository, userHomePageSalonInfo).state,
        Initial(),
      );
    });

    group('LoadDataOnStart', () {
      blocTest<AboutSalonPageCubit, AboutSalonPageState>(
        'Data loading failed',
        build: () => AboutSalonPageCubit(repository, userHomePageSalonInfo),
        setUp: () => repository.returnSuccess = false,
        expect: () => [
          const LoadOwnerProfilePicture(),
          const LoadAttendeeProfilePicture(),
        ],
        verify: (cubit) {
          expect(cubit.ownerProfilePictureUrls.first, '');
          expect(cubit.attendeeProfilePictureUrls.first, '');
        },
      );

      blocTest<AboutSalonPageCubit, AboutSalonPageState>(
        'Data loading Success',
        build: () => AboutSalonPageCubit(repository, userHomePageSalonInfo),
        expect: () => [
          const LoadOwnerProfilePicture(),
          const LoadAttendeeProfilePicture(),
        ],
        verify: (cubit) {
          expect(cubit.ownerProfilePictureUrls.first, 'fake_image_url');
          expect(cubit.attendeeProfilePictureUrls.first, 'fake_image_url');
        },
      );
    });
  });
}
