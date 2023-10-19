import 'dart:ui';

class UserHomePageFilter {
  String salonName;
  int salonAvailability;
  String location;
  String address;

  UserHomePageFilter({
    this.salonName = '',
    this.salonAvailability = 0,
    this.location = '',
    this.address = '',
  });

  @override
  String toString() {
    return 'Salon Name: $salonName, Availability: $salonAvailability, Location: $location, Address: $address)';
  }
}
