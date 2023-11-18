import 'package:repository/user/book_page/book_page_repository.dart';
import 'package:repository/user/book_page/models/book_slot.dart';
import 'package:repository/user/user_profile_page/models/user_profile.dart';

class FakeBookPageRepository implements BookPageRepository {
  var returnSuccess = true;

  @override
  Future<bool> saveBookingData(BookSlot bookSlot, UserProfile userProfile) async {
    return returnSuccess;
  }
}
