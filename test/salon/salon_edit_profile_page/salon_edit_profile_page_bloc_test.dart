import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/salon/salon_edit_profile_page/models/edit_profile_page_salon_info.dart';
import 'package:salon_hub/salon/salon_edit_profile_page/bloc/salon_edit_profile_page_bloc.dart';
import 'package:salon_hub/utils/strings.dart';
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

    group('SaveDetailsButtonClicked', () {
      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Show empty business name error',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = '';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterBusinessName);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Show invalid phone number error',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = 'Hair Salon';
          bloc.isPhoneNumberValid = false;
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterValidPhoneNumber);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Show empty address error',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.salonInfo.salonAddress = '';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterAddress);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Show empty services error',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.salonInfo.salonAddress = 'Mumbai';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.addServices);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Show empty owner details error',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.salonInfo.salonAddress = 'Mumbai';
          bloc.salonInfo.services.add('Hair Cut');
          bloc.salonInfo.ownerDetailsList.add(OwnerDetail());
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.addOwnerDetails);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Update salon data if all required fields are filled',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.salonInfo.salonName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.salonInfo.salonAddress = 'Mumbai';
          bloc.salonInfo.services.add('Hair Cut');
          bloc.salonInfo.ownerDetailsList.add(OwnerDetail(name: 'Areeb'));
          bloc.add(const SaveDetailsButtonClicked());
        },
        expect: () => [Loading(), isA<ShowToast>(), ProfileDataUpdateSuccess()],
      );
    });

    group('Add/RemoveService', () {
      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Add Service',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddService('Massage'));
        },
        verify: (bloc) {
          bloc.salonInfo.services.last == 'Massage';
          bloc.state is ServicesUpdated;
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Remove Service',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddService('Hair'));
          bloc.add(const RemoveService('Hair'));
        },
        verify: (bloc) {
          bloc.salonInfo.services.last == '';
          bloc.state is ServicesUpdated;
        },
      );
    });

    group('OwnerDetailUpdate', () {
      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Add Owner Detail',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddOwner());
        },
        expect: () => [isA<OwnerDetailsListUpdated>()],
        verify: (bloc) {
          expect(bloc.salonInfo.ownerDetailsList.length, 1);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Do not add more than 10 Owners',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
          bloc.add(const AddOwner());
        },
        expect: () => [
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
          isA<ShowToast>(),
        ],
        verify: (bloc) {
          expect(bloc.salonInfo.ownerDetailsList.length, 10);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Remove Owner Detail',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddOwner());
          bloc.add(const RemoveOwner(0));
        },
        expect: () => [
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
        ],
        verify: (bloc) {
          expect(bloc.salonInfo.ownerDetailsList.length, 0);
        },
      );
    });

    group('AttendeeDetailsUpdate', () {
      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Add Attendee Detail',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddAttendee());
        },
        expect: () => [isA<AttendeeDetailsListUpdated>()],
        verify: (bloc) {
          expect(bloc.salonInfo.attendeeDetailList.length, 1);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Do not add more than 20 Attendees',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
          bloc.add(const AddAttendee());
        },
        expect: () => [
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
          isA<ShowToast>(),
        ],
        verify: (bloc) {
          expect(bloc.salonInfo.attendeeDetailList.length, 20);
        },
      );

      blocTest<SalonEditProfilePageBloc, SalonEditProfilePageState>(
        'Remove Attendee Detail',
        build: () => SalonEditProfilePageBloc(
          repository,
          EditProfilePageSalonInfo.getDefault(),
        ),
        act: (bloc) {
          bloc.add(const AddAttendee());
          bloc.add(const RemoveAttendee(0));
        },
        expect: () => [
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
        ],
        verify: (bloc) {
          expect(bloc.salonInfo.attendeeDetailList.length, 0);
        },
      );
    });
  });
}
