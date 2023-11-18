import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_repository.dart';
import 'package:repository/auth/salon_auth/salon_registration/salon_registration_states.dart';

class FakeSalonRegistrationRepository implements SalonRegistrationRepository {
  var returnSuccess = true;

  @override
  Stream<SalonRegistrationRepositoryState> registerSalon(
      {required SalonRegistrationData data}) async* {
    if (returnSuccess) {
      yield Success();
    } else {
      yield const Failure('Server error');
    }
  }
}
