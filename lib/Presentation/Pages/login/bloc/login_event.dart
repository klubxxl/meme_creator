part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPasswordChangedEvent extends LoginEvent {
  LoginPasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginEmailChangedEvent extends LoginEvent {
  LoginEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginFormSubmittedEvent extends LoginEvent {
  const LoginFormSubmittedEvent();

  @override
  List<Object?> get props => [];
}
