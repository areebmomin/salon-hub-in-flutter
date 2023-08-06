class UserRegistrationData {
  var name = '';
  var phoneNumber = '';
  var isPhoneNumberValid = false;
  var email = '';
  var address = '';
  var isTermsAndConditionAccepted = false;

  Map<String, dynamic> map() {
    return <String, dynamic>{
      "name": name,
      "phone_number": phoneNumber,
      "email": email,
      "address": address,
    };
  }
}
