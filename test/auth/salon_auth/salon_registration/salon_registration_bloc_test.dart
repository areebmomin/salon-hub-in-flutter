import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/auth/salon_auth/salon_registration/bloc/salon_registration_bloc.dart';
import '../../../fakes/repositories/fake_salon_registration_repository.dart';

void main() {
  group('SalonRegistrationBloc', () {
    late FakeSalonRegistrationRepository repository;

    setUp(() {
      repository = FakeSalonRegistrationRepository();
    });

    test('initial state is SalonRegistrationBloc.Initial', () {
      expect(
        SalonRegistrationBloc(repository).state,
        Initial(),
      );
    });
  });
}
