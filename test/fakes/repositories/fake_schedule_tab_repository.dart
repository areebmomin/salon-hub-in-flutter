import 'package:repository/auth/salon_auth/salon_registration/models/salon_registration_data.dart';
import 'package:repository/salon/request_tab_view/models/booking_data.dart';
import 'package:repository/salon/schedule_tab_view/schedule_tab_view_repository.dart';
import 'package:repository/user/book_page/models/book_slot.dart';
import 'package:repository/utils/exceptions/database_exception.dart';

class FakeScheduleTabRepository implements ScheduleTabRepository {
  var returnSuccess = true;
  var list = [
    BookingData(
      'id',
      12308973830,
      '12-09-2023',
      ServiceTime(
          startTime: Time(hour: 9, minute: 0),
          endTime: Time(hour: 5, minute: 0)),
      List.empty(),
      '',
      '',
      '',
      BookingStatus.pending,
      '',
      '',
      '',
    ),
    BookingData.getDefault(),
    BookingData.getDefault(),
  ];

  @override
  Future<List<BookingData>> getScheduledBookings(String formattedDate) async {
    if (returnSuccess) {
      return list;
    } else {
      throw DatabaseException('Unable to load salon data');
    }
  }
}
