import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salon_hub/auth/salon_auth/salon_registration/bloc/salon_registration_bloc.dart';
import 'package:salon_hub/utils/strings.dart';
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

    group('SaveDetailsButtonClicked', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show empty business name error',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = '';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterBusinessName);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show invalid phone number error',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = 'Hair Salon';
          bloc.isPhoneNumberValid = false;
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterValidPhoneNumber);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show empty address error',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.data.address = '';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.enterAddress);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show empty services error',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.data.address = 'Mumbai';
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.addServices);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show empty owner details error',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.data.address = 'Mumbai';
          bloc.data.services.add('Hair Cut');
          bloc.add(const SaveDetailsButtonClicked());
        },
        verify: (bloc) {
          var showToast = bloc.state as ShowToast;
          expect(showToast.message, Strings.addOwnerDetails);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Open verify page if all required fields are correct',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.businessName = 'Hair Salon';
          bloc.isPhoneNumberValid = true;
          bloc.data.address = 'Mumbai';
          bloc.data.services.add('Hair Cut');
          bloc.data.ownerDetailsList.first.name = 'Areeb';
          bloc.add(const SaveDetailsButtonClicked());
        },
        expect: () => [OpenVerifyPage()],
      );
    });

    group('Add/RemoveService', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Add Service',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddService('Massage'));
        },
        verify: (bloc) {
          bloc.data.services.last == 'Massage';
          bloc.state is ServicesUpdated;
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Remove Service',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddService('Hair'));
          bloc.add(const RemoveService('Hair'));
        },
        verify: (bloc) {
          bloc.data.services.last == '';
          bloc.state is ServicesUpdated;
        },
      );
    });

    group('RegisterNowButtonClicked', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Do not perform action when loading',
        build: () => SalonRegistrationBloc(repository),
        seed: () => Loading(),
        act: (bloc) => bloc.add(const RegisterNowButtonClicked()),
        expect: () => [],
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show toast when email is not valid',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.email = 'test';
          bloc.add(const RegisterNowButtonClicked());
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidEmail);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Show toast when password is not valid',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.email = 'test@gmail.com';
          bloc.data.password = '123';
          bloc.add(const RegisterNowButtonClicked());
        },
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.enterValidPasscode);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Return success when Registration is successful',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.email = 'test@gmail.com';
          bloc.data.password = '123456';
          bloc.add(const RegisterNowButtonClicked());
        },
        expect: () => [Loading(), GotoSalonHomePage()],
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Return Failure when Registration is not successful',
        setUp: () => repository.returnSuccess = false,
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.data.email = 'test@gmail.com';
          bloc.data.password = '123456';
          bloc.add(const RegisterNowButtonClicked());
        },
        expect: () => [Loading(), isA<ShowToast>()],
      );
    });

    group('CloseButtonClicked', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Close button clicked',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const CloseButtonClickedEvent());
        },
        expect: () => [CloseButtonClicked()],
      );
    });

    group('VerifyPageCloseButtonClicked', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Verify close button clicked',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const VerifyPageCloseButtonClickedEvent());
        },
        expect: () => [VerifyCloseButtonClicked()],
      );
    });

    group('OwnerDetailUpdate', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Add Owner Detail',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddOwner());
        },
        expect: () => [isA<OwnerDetailsListUpdated>()],
        verify: (bloc) {
          expect(bloc.data.ownerDetailsList.length, 2);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Do not add more than 10 Owners',
        build: () => SalonRegistrationBloc(repository),
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
          isA<ShowToast>(),
        ],
        verify: (bloc) {
          expect(bloc.data.ownerDetailsList.length, 10);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Remove Owner Detail',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddOwner());
          bloc.add(const RemoveOwner(1));
        },
        expect: () => [
          isA<OwnerDetailsListUpdated>(),
          isA<OwnerDetailsListUpdated>(),
        ],
        verify: (bloc) {
          expect(bloc.data.ownerDetailsList.length, 1);
        },
      );
    });

    group('AttendeeDetailsUpdate', () {
      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Add Attendee Detail',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddAttendee());
        },
        expect: () => [isA<AttendeeDetailsListUpdated>()],
        verify: (bloc) {
          expect(bloc.data.attendeeDetailList.length, 2);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Do not add more than 20 Attendees',
        build: () => SalonRegistrationBloc(repository),
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
          isA<ShowToast>(),
        ],
        verify: (bloc) {
          expect(bloc.data.attendeeDetailList.length, 20);
        },
      );

      blocTest<SalonRegistrationBloc, SalonRegistrationState>(
        'Remove Attendee Detail',
        build: () => SalonRegistrationBloc(repository),
        act: (bloc) {
          bloc.add(const AddAttendee());
          bloc.add(const RemoveAttendee(1));
        },
        expect: () => [
          isA<AttendeeDetailsListUpdated>(),
          isA<AttendeeDetailsListUpdated>(),
        ],
        verify: (bloc) {
          expect(bloc.data.attendeeDetailList.length, 1);
        },
      );
    });
  });
}
