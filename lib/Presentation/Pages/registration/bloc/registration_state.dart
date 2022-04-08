part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationInitialState extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegistrationFormValidState extends RegistrationState {
  const RegistrationFormValidState();

  @override
  List<Object> get props => [];
}

class RegistrationFormInvalidState extends RegistrationState {
  const RegistrationFormInvalidState(
      {required this.passwordErrorText, required this.emailErrorText});

  final String passwordErrorText, emailErrorText;

  @override
  List<Object> get props => [emailErrorText, passwordErrorText];
}

class RegistrationLoadingState extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationSuccessState extends RegistrationState {
  const RegistrationSuccessState();

  @override
  List<Object?> get props => [];
}

class RegistrationErrorState extends RegistrationState {
  final String errorText;

  const RegistrationErrorState(this.errorText);

  @override
  List<Object?> get props => [errorText];
}
