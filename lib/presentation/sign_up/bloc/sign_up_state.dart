import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hydrus/core/widgets/form_fields/form_inputs/text_input.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = FormzStatus.pure,
    this.businessName = const TextInputz.pure(),
    this.website = const TextInputz.pure(),
    this.currencyCode = const TextInputz.pure(),
    this.countryCode = const TextInputz.pure(),
    this.ipnUri = const TextInputz.pure(),
    this.firstName = const TextInputz.pure(),
    this.lastName = const TextInputz.pure(),
    this.emailAddress = const TextInputz.pure(),
    this.phoneNumber = const TextInputz.pure(),
    this.password = const TextInputz.pure(),
    this.confirmPassword = const TextInputz.pure(),
  });

  final FormzStatus status;

  final TextInputz businessName;
  final TextInputz website;
  final TextInputz currencyCode;
  final TextInputz countryCode;
  final TextInputz ipnUri;
  final TextInputz firstName;
  final TextInputz lastName;
  final TextInputz emailAddress;
  final TextInputz phoneNumber;
  final TextInputz password;
  final TextInputz confirmPassword;

  SignUpState copyWith({
    FormzStatus? status,
    TextInputz? businessName,
    TextInputz? website,
    TextInputz? currencyCode,
    TextInputz? countryCode,
    TextInputz? ipnUri,
    TextInputz? firstName,
    TextInputz? lastName,
    TextInputz? emailAddress,
    TextInputz? phoneNumber,
    TextInputz? password,
    TextInputz? confirmPassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      businessName: businessName ?? this.businessName,
      website: website ?? this.website,
      currencyCode: currencyCode ?? this.currencyCode,
      countryCode: countryCode ?? this.countryCode,
      ipnUri: ipnUri ?? this.ipnUri,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        businessName,
        website,
        currencyCode,
        countryCode,
        ipnUri,
        firstName,
        lastName,
        emailAddress,
        phoneNumber,
        password,
        confirmPassword,
      ];

  List<FormzInput> allInputs() {
    return [
      businessName,
      website,
      currencyCode,
      countryCode,
      ipnUri,
      firstName,
      lastName,
      emailAddress,
      phoneNumber,
      password,
      confirmPassword,
    ];
  }
}
