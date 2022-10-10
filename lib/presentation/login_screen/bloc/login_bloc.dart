import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hydrus/core/services/rest_api/rest_api_services.dart';
import 'package:hydrus/core/utils/helpers/app_helpers.dart';
import 'package:hydrus/core/utils/services/user_api.dart';
import 'package:hydrus/core/widgets/form_fields/form_inputs/password.dart';
import 'package:hydrus/core/widgets/form_fields/form_inputs/username.dart';
import 'package:hydrus/models/response_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginEmailChanged) {
      emit(_mapEmailChangedToState(event, state));
    } else if (event is LoginPasswordChanged) {
      emit(_mapPasswordChangedToState(event, state));
    } else if (event is LoginSubmitted) {
      print("=================");
      await _mapLoginSubmittedToState(event, state, emit);
    }
  }

  /* @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  } */

  LoginState _mapEmailChangedToState(
    LoginEmailChanged event,
    LoginState state,
  ) {
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    );
  }

  Future _mapLoginSubmittedToState(LoginSubmitted event, LoginState state, Emitter<LoginState> emit) async {
    print("They called me");
    if (state.status.isValidated) {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
      ));
      try {
        var api = UserApi.withAuthRepository(_authenticationRepository);
        ResponseModel loginRes = await api.login({
          'email': state.email.value,
          'password': state.password.value,
        });
        print("***************************${loginRes.toMap()}***************************");
        if (loginRes.status == true) {
          await onAuthenticated(loginRes, _authenticationRepository);

          emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
          ));
        } else {
          Snackbar.errSnackBar('Login Failed', loginRes.message ?? RestApiServices.errMessage);

          emit(state.copyWith(status: FormzStatus.submissionFailure, message: loginRes.message));
        }
      } on Exception catch (_) {
        Snackbar.errSnackBar('Login Failed', RestApiServices.errMessage);

        emit(state.copyWith(status: FormzStatus.submissionFailure, message: UserApi.errMessage));
      }
    }
  }
}
