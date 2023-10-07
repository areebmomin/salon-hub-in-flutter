class UserProfile {
  final String _name;
  final String _phoneNumber;
  final String _email;
  final String _address;

  UserProfile([
    this._name = '',
    this._phoneNumber = '',
    this._email = '',
    this._address = '',
  ]);

  UserProfile.fromDocumentSnapshot(Map<String, dynamic> doc)
      : _name = doc['name'] ?? '',
        _phoneNumber = doc['phone_number'] ?? '',
        _email = doc['email'] ?? '',
        _address = doc['address'] ?? '';

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  String get email => _email;

  String get address => _address;

  @override
  String toString() {
    return 'Name: $_name, Phone Number: $_phoneNumber, Email: $_email, Address: $_address';
  }
}
