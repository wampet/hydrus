import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:hydrus/core/services/rest_api/rest_api_services.dart';
import 'package:hydrus/core/utils/helpers/app_helpers.dart';
import 'package:hydrus/core/utils/services/user_api.dart';
import 'package:hydrus/core/widgets/form_fields/form_inputs/text_input.dart';
import 'package:hydrus/presentation/sign_up/bloc/sign_up_state.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpEvent>(_onSignUpEvent);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onSignUpEvent(SignUpEvent event, Emitter<SignUpState> emit) async {
    if (event is SignUpBusinessNameChanged) {
      emit(_mapBusinessNameChangedToState(event, state));
    } else if (event is SignUpWebsiteChanged) {
      emit(_mapWebsiteChangedToState(event, state));
    } else if (event is SignUpCurrencyCodeChanged) {
      emit(_mapCurrencyCodeChangedToState(event, state));
    } else if (event is SignUpCountryCodeChanged) {
      emit(_mapCountryCodeChangedToState(event, state));
    } else if (event is SignUpIpnUriChanged) {
      emit(_mapIpnUriChangedToState(event, state));
    } else if (event is SignUpFirstNameChanged) {
      emit(_mapFirstNameChangedToState(event, state));
    } else if (event is SignUpLastNameChanged) {
      emit(_mapLastNameChangedToState(event, state));
    } else if (event is SignUpEmailAddressChanged) {
      emit(_mapEmailAddressChangedToState(event, state));
    } else if (event is SignUpPhoneNumberChanged) {
      emit(_mapPhoneNumberChangedToState(event, state));
    } else if (event is SignUpPasswordChanged) {
      emit(_mapPasswordChangedToState(event, state));
    } else if (event is SignUpConfirmPasswordChanged) {
      emit(_mapConfirmPasswordChangedToState(event, state));
    } else if (event is SignUpSubmitted) {
      await _mapSignUpSubmittedToState(event, state, emit);
    }
  }

  /* @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpBusinessNameChanged) {
      yield _mapBusinessNameChangedToState(event, state);
    } else if (event is SignUpWebsiteChanged) {
      yield _mapWebsiteChangedToState(event, state);
    } else if (event is SignUpCurrencyCodeChanged) {
      yield _mapCurrencyCodeChangedToState(event, state);
    } else if (event is SignUpCountryCodeChanged) {
      yield _mapCountryCodeChangedToState(event, state);
    } else if (event is SignUpIpnUriChanged) {
      yield _mapIpnUriChangedToState(event, state);
    } else if (event is SignUpFirstNameChanged) {
      yield _mapFirstNameChangedToState(event, state);
    } else if (event is SignUpLastNameChanged) {
      yield _mapLastNameChangedToState(event, state);
    } else if (event is SignUpEmailAddressChanged) {
      yield _mapEmailAddressChangedToState(event, state);
    } else if (event is SignUpPhoneNumberChanged) {
      yield _mapPhoneNumberChangedToState(event, state);
    } else if (event is SignUpPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is SignUpConfirmPasswordChanged) {
      yield _mapConfirmPasswordChangedToState(event, state);
    }
  } */

  SignUpState _mapBusinessNameChangedToState(
    SignUpBusinessNameChanged event,
    SignUpState state,
  ) {
    final businessName = TextInputz.dirty(event.businessName);
    return state.copyWith(
      businessName: businessName,
    );
  }

  SignUpState _mapWebsiteChangedToState(
    SignUpWebsiteChanged event,
    SignUpState state,
  ) {
    final website = TextInputz.dirty(event.website);
    return state.copyWith(website: website);
  }

  SignUpState _mapCurrencyCodeChangedToState(
    SignUpCurrencyCodeChanged event,
    SignUpState state,
  ) {
    final currencyCode = TextInputz.dirty(event.currencyCode);
    return state.copyWith(currencyCode: currencyCode);
  }

  SignUpState _mapCountryCodeChangedToState(
    SignUpCountryCodeChanged event,
    SignUpState state,
  ) {
    final countryCode = TextInputz.dirty(event.countryCode);
    return state.copyWith(
      countryCode: countryCode,
    );
  }

  SignUpState _mapIpnUriChangedToState(
    SignUpIpnUriChanged event,
    SignUpState state,
  ) {
    final currencyCode = TextInputz.dirty(event.ipnUri);
    return state.copyWith(
      currencyCode: currencyCode,
    );
  }

  SignUpState _mapFirstNameChangedToState(
    SignUpFirstNameChanged event,
    SignUpState state,
  ) {
    final firstName = TextInputz.dirty(event.firstName);
    return state.copyWith(
      firstName: firstName,
    );
  }

  SignUpState _mapLastNameChangedToState(
    SignUpLastNameChanged event,
    SignUpState state,
  ) {
    final lastName = TextInputz.dirty(event.lastName);
    return state.copyWith(
      lastName: lastName,
    );
  }

  SignUpState _mapEmailAddressChangedToState(
    SignUpEmailAddressChanged event,
    SignUpState state,
  ) {
    final emailAddress = TextInputz.dirty(event.emailAddress);
    return state.copyWith(
      emailAddress: emailAddress,
    );
  }

  SignUpState _mapPhoneNumberChangedToState(
    SignUpPhoneNumberChanged event,
    SignUpState state,
  ) {
    final phoneNumber = TextInputz.dirty(event.phoneNumber);
    return state.copyWith(
      phoneNumber: phoneNumber,
    );
  }

  SignUpState _mapPasswordChangedToState(
    SignUpPasswordChanged event,
    SignUpState state,
  ) {
    final password = TextInputz.dirty(event.password);
    return state.copyWith(
      password: password,
    );
  }

  SignUpState _mapConfirmPasswordChangedToState(
    SignUpConfirmPasswordChanged event,
    SignUpState state,
  ) {
    final confirmPassword = TextInputz.dirty(event.confirmPassword);
    return state.copyWith(
      confirmPassword: confirmPassword,
    );
  }

  Future _mapSignUpSubmittedToState(SignUpSubmitted event, SignUpState state, Emitter<SignUpState> emit) async {
    bool canSubmit = Formz.validate(allStateInputs(state)) == FormzStatus.valid;
    if (canSubmit) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      try {
        var api = UserApi.withAuthRepository(_authenticationRepository);
        var signUpRes = await api.signUp({
          'businessName': state.businessName.value,
          'website': state.website.value,
          'currencyCode': state.currencyCode.value,
          'countryCode': state.countryCode.value,
          'ipnUri': state.ipnUri.value,
          'firstName': state.firstName.value,
          'lastName': state.lastName.value,
          'emailAddress': state.emailAddress.value,
          'phoneNumber': state.phoneNumber.value,
          'password': state.password.value,
          'confirmPassword': state.confirmPassword.value,
        });
        if (signUpRes.status == true) {
          emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
          ));

          await onAuthenticated(signUpRes, _authenticationRepository);
        } else {
          Snackbar.errSnackBar('Sign Up Failed', signUpRes.message ?? RestApiServices.errMessage);

          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
        // yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      Snackbar.errSnackBar('Missing Fields', "fill the registration form");
    }
  }

  List<FormzInput> allStateInputs(SignUpState state) {
    return state.allInputs();
  }
}
