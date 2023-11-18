import 'package:flutter_test/flutter_test.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:salon_hub/user/about_salon_page/cubit/about_salon_page_cubit.dart';
import '../../fakes/repositories/fake_about_salon_page_repository.dart';

void main() {
  group('AboutSalonPageCubit', () {
    late FakeAboutSalonPageRepository repository;

    setUp(() {
      repository = FakeAboutSalonPageRepository();
    });

    test('initial state is AboutSalonPageCubit.Initial', () {
      expect(
        AboutSalonPageCubit(repository, UserHomePageSalonInfo.getDefault()).state,
        Initial(),
      );
    });
  });
}
