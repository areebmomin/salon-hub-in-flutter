class UserProfile {
  String name;
  String phoneNumber;
  String email;
  String address;

  UserProfile([
    this.name = '',
    this.phoneNumber = '',
    this.email = '',
    this.address = '',
  ]);

  void copy(UserProfile userProfile) {
    name = userProfile.name;
    phoneNumber = userProfile.phoneNumber;
    email = userProfile.email;
    address = userProfile.address;
  }

  UserProfile.fromDocumentSnapshot(Map<String, dynamic> doc)
      : name = doc['name'] ?? '',
        phoneNumber = doc['phone_number'] ?? '',
        email = doc['email'] ?? '',
        address = doc['address'] ?? '';

  @override
  String toString() {
    return 'Name: $name, Phone Number: $phoneNumber, Email: $email, Address: $address';
  }
}
