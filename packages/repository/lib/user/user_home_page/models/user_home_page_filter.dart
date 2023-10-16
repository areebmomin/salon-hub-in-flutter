import 'dart:ui';

class UserHomePageFilter {
  String salonName;
  String salonAvailability;
  String location;
  String address;

  UserHomePageFilter({
    this.salonName = '',
    this.salonAvailability = '',
    this.location = '',
    this.address = '',
  });

  @override
  String toString() {
    return 'Salon Name: $salonName, Availability: $salonAvailability, Location: $location, Address: $address)';
  }
}
