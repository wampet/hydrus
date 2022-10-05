import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:hydrus/config/authentication/authentication.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:hydrus/presentation/sign_up/sign_up.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {}
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FirstNameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            LastNameInput(),
            EmailInput(),
            PhoneNumberInput(),
            CountryCodeInput(),
            CurrencyCodeInput(),
            BusinessNameInput(),
            PasswordInput(),
            ConfirmPasswordInput(),
            Website(),
            IpnUri(),
            const Padding(padding: EdgeInsets.all(12)),
            SignUpButton(),
            const Padding(padding: EdgeInsets.all(12)),
            PrevAcctButton(),
          ],
        ),
      ),
    );
  }
}

class FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            initialValue: state.firstName.value,
            key: const Key('signUpForm_nameInput_textField'),
            onChanged: (firstName) => context
                .read<SignUpBloc>()
                .add(SignUpFirstNameChanged(firstName)),
            decoration: InputDecoration(
              hintText: 'Your first name',
              errorText: state.firstName.invalid ? 'invalid name' : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.76)),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            ),
          ),
        );
      },
    );
  }
}

//Other name input field
class LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Your other name',
          errorText: state.lastName.invalid ? 'Invalid name' : null,
          initialValue: state.lastName.value,
          onChanged: (lastName) =>
              context.read<SignUpBloc>().add(SignUpLastNameChanged(lastName)),
        );
      },
    );
  }
}

//Contact input field
class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return IntlPhoneField(
            initialValue: state.phoneNumber.value,
            key: const Key('signUpForm_nameInput_textField'),
            disableLengthCheck: true,
            flagsButtonMargin: EdgeInsets.symmetric(horizontal: 20),
            cursorColor: ColorConstant.black900,
            showDropdownIcon: false,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintText: 'Phone number',
              errorText: state.phoneNumber.invalid ? 'Invalid contact' : null,
              labelStyle: AppStyle.textstyleregularform16,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
            initialCountryCode: 'UG');
      },
    );
  }
}

//Country code
class CountryCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.countryCode != current.countryCode,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Your country code',
          errorText: state.countryCode.invalid ? 'Invalid code' : null,
          initialValue: state.countryCode.value,
          onChanged: (countryCode) => context
              .read<SignUpBloc>()
              .add(SignUpCountryCodeChanged(countryCode)),
        );
      },
    );
  }
}

//Currency code
class CurrencyCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.currencyCode != current.currencyCode,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Your country code',
          errorText: state.currencyCode.invalid ? 'Invalid code' : null,
          initialValue: state.currencyCode.value,
          onChanged: (currencyCode) => context
              .read<SignUpBloc>()
              .add(SignUpCurrencyCodeChanged(currencyCode)),
        );
      },
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return CustomFormzField(
          initialValue: state.emailAddress.value,
          key: const Key('signUpForm_emailAddressInput_textField'),
          onChanged: (emailAddress) => context
              .read<SignUpBloc>()
              .add(SignUpEmailAddressChanged(emailAddress)),
          hintText: 'emailAddress',
          errorText:
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(state.emailAddress.value) &&
                      (state.emailAddress.value.toString().isNotEmpty)
                  ? 'invalid email'
                  : null,
        );
      },
    );
  }
}

// Password
class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Password',
          errorText: state.password.invalid ? 'Invalid password' : null,
          initialValue: state.password.value,
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
        );
      },
    );
  }
}

// Password
class ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Password',
          errorText:
              state.confirmPassword.invalid ? 'Invalid confirmPassword' : null,
          initialValue: state.confirmPassword.value,
          onChanged: (confirmPassword) => context
              .read<SignUpBloc>()
              .add(SignUpConfirmPasswordChanged(confirmPassword)),
        );
      },
    );
  }
}

//Business name
class BusinessNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.businessName != current.businessName,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Your company businessName',
          errorText: state.businessName.invalid ? 'Invalid businessName' : null,
          initialValue: state.businessName.value,
          onChanged: (businessName) => context
              .read<SignUpBloc>()
              .add(SignUpBusinessNameChanged(businessName)),
        );
      },
    );
  }
}

//Website input field
class Website extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.website != current.website,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Website',
          errorText: state.website.invalid ? 'Invalid website' : null,
          initialValue: state.website.value,
          onChanged: (website) =>
              context.read<SignUpBloc>().add(SignUpWebsiteChanged(website)),
        );
      },
    );
  }
}

//ipnUri Input field
class IpnUri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.ipnUri != current.ipnUri,
      builder: (context, state) {
        return CustomFormzField(
          hintText: 'Ipn Uri',
          errorText: state.ipnUri.invalid ? 'Invalid ipnUri' : null,
          initialValue: state.ipnUri.value,
          onChanged: (ipnUri) =>
              context.read<SignUpBloc>().add(SignUpIpnUriChanged(ipnUri)),
        );
      },
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('signupForm_continue_raisedButton'),
                child: const Text('Sign Up'),
                onPressed: () {
                  context.read<SignUpBloc>().add(SignUpSubmitted());
                },
              );
      },
    );
  }
}

class PrevAcctButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('signupForm_linktologin_raisedButton'),
          child: const Text('old account?'),
          onPressed: () {
            context.read<AuthenticationBloc>().add(AuthenticationStatusChanged(
                AuthenticationStatus.unauthenticated));
          },
        );
      },
    );
  }
}
