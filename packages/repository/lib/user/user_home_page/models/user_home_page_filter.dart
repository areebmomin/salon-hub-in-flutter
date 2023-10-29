import 'dart:ui';

class UserHomePageFilter {
  String salonName;
  int salonAvailability;
  String address;

  UserHomePageFilter({
    this.salonName = '',
    this.salonAvailability = 0,
    this.address = '',
  });

  @override
  String toString() {
    return 'Salon Name: $salonName, Availability: $salonAvailability, Address: $address)';
  }
}
