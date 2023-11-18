import 'package:flutter_test/flutter_test.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:salon_hub/salon/salon_edit_profile_page/bloc/salon_edit_profile_page_bloc.dart';
import '../../fakes/repositories/fake_salon_edit_profile_page_repository.dart';

void main() {
  group('SalonEditProfilePageBloc', () {
    late FakeSalonEditProfilePageRepository repository;

    setUp(() {
      repository = FakeSalonEditProfilePageRepository();
    });

    test('initial state is SalonEditProfilePageBloc.Initial', () {
      expect(
        SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ).state,
        Initial(),
      );
    });
  });
}
