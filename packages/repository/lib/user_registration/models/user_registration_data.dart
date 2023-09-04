class UserRegistrationData {
  String name;
  String phoneNumber;
  bool isPhoneNumberValid;
  String email;
  String address = '';
  bool isTermsAndConditionAccepted;

  UserRegistrationData({
    this.name = '',
    this.phoneNumber = '',
    this.isPhoneNumberValid = false,
    this.email = '',
    this.address = '',
    this.isTermsAndConditionAccepted = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}
