part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegistrationPasswordChangedEvent extends RegistrationEvent {
  RegistrationPasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegistrationEmailChangedEvent extends RegistrationEvent {
  RegistrationEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegistrationFormSubmittedEvent extends RegistrationEvent {
  const RegistrationFormSubmittedEvent();

  @override
  List<Object?> get props => [];
}
