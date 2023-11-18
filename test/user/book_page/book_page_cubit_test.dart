import 'package:flutter_test/flutter_test.dart';
import 'package:repository/user/user_home_page/models/user_home_page_salon_info.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';
import 'package:salon_hub/user/book_page/cubit/book_page_cubit.dart';
import '../../fakes/repositories/fake_book_page_repository.dart';

void main() {
  group('BookPageCubit', () {
    late FakeBookPageRepository repository;

    setUp(() {
      repository = FakeBookPageRepository();
    });

    test('initial state is BookPageCubit.Initial', () {
      expect(
        BookPageCubit(
          repository,
          UserHomePageSalonInfo.getDefault(),
          UserProfile(
            'Areeb',
            '+91 8127422387',
            'aribtest@gmail.com',
            'Mumbai',
          ),
        ).state,
        Initial(),
      );
    });
  });
}
