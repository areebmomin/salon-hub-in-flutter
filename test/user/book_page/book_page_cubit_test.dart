import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:salon_hub/user/book_page/cubit/book_page_cubit.dart';
import 'package:salon_hub/utils/strings.dart';
import '../../fakes/repositories/fake_book_page_repository.dart';

void main() {
  group('BookPageCubit', () {
    late FakeBookPageRepository repository;
    late BookPageCubit bookPageCubit;

    setUp(() {
      repository = FakeBookPageRepository();
      bookPageCubit = BookPageCubit(
        repository,
        UserHomePageSalonInfo.getDefault(),
        UserProfile(
          'Areeb',
          '+91 8127422387',
          'aribtest@gmail.com',
          'Mumbai',
        ),
      );
    });

    test('initial state is BookPageCubit.Initial', () {
      expect(
        bookPageCubit.state,
        Initial(),
      );
    });

    group('BookButtonClicked', () {
      blocTest<BookPageCubit, BookPageState>(
        'Check for empty service case',
        build: () => bookPageCubit,
        act: (cubit) {
          cubit.bookButtonClicked();
        },
        expect: () => [isA<ShowToast>()],
      );

      blocTest<BookPageCubit, BookPageState>(
        'Handle failed case',
        build: () => bookPageCubit,
        setUp: () => repository.returnSuccess = false,
        act: (cubit) {
          cubit.bookSlot.services.add('Hair');
          cubit.bookButtonClicked();
        },
        expect: () => [Loading(), isA<ShowToast>()],
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.serverError);
        },
      );

      blocTest<BookPageCubit, BookPageState>(
        'Do not perform action when loading',
        build: () => bookPageCubit,
        seed: () => Loading(),
        act: (cubit) => cubit.bookButtonClicked(),
        expect: () => [],
      );

      blocTest<BookPageCubit, BookPageState>(
        'Handle Success case',
        build: () => bookPageCubit,
        act: (cubit) {
          cubit.bookSlot.services.add('Hair');
          cubit.bookButtonClicked();
        },
        expect: () => [Loading(), isA<ShowToast>()],
        verify: (cubit) {
          var showToast = cubit.state as ShowToast;
          expect(showToast.message, Strings.bookingRequestSentSuccessfully);
        },
      );
    });
  });
}
