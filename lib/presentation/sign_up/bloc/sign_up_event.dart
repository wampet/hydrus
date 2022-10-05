part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  SignUpEvent({
    this.businessName,
    this.website,
    this.currencyCode,
    this.countryCode,
    this.ipnUri,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });
  String? businessName;
  String? website;
  String? currencyCode;
  String? countryCode;
  String? ipnUri;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
}

class SignUpBusinessNameChanged extends SignUpEvent {
  SignUpBusinessNameChanged(this.businessName);

  final String businessName;
}

class SignUpWebsiteChanged extends SignUpEvent {
  SignUpWebsiteChanged(this.website);

  final String website;
}

class SignUpCurrencyCodeChanged extends SignUpEvent {
  SignUpCurrencyCodeChanged(this.currencyCode);

  final String currencyCode;
}
class SignUpCountryCodeChanged extends SignUpEvent {
  SignUpCountryCodeChanged(this.countryCode);

  final String countryCode;
}

class SignUpIpnUriChanged extends SignUpEvent {
  SignUpIpnUriChanged(this.ipnUri);

  final String ipnUri;
}

class SignUpFirstNameChanged extends SignUpEvent {
  SignUpFirstNameChanged(this.firstName);

  final String firstName;
}
class SignUpLastNameChanged extends SignUpEvent {
  SignUpLastNameChanged(this.lastName);

  final String lastName;
}

class SignUpEmailAddressChanged extends SignUpEvent {
  SignUpEmailAddressChanged(this.emailAddress);

  final String emailAddress;
}
class SignUpPhoneNumberChanged extends SignUpEvent {
  SignUpPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;
}

class SignUpPasswordChanged extends SignUpEvent {
  SignUpPasswordChanged(this.password);

  final String password;
}
class SignUpConfirmPasswordChanged extends SignUpEvent {
  SignUpConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;
}

class SignUpSubmitted extends SignUpEvent {
  SignUpSubmitted();
}
