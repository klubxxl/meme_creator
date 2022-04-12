part of 'my_navigator_bloc.dart';

abstract class MyNavigatorEvent extends Equatable {
  const MyNavigatorEvent();

  @override
  List<Object> get props => [];
}

class MyRegistrationButtonEvent extends MyNavigatorEvent {
  const MyRegistrationButtonEvent();

  @override
  List<Object> get props => [];
}

class MyLoginButtonEvent extends MyNavigatorEvent {
  const MyLoginButtonEvent();

  @override
  List<Object> get props => [];
}

class MyOnboardingEvent extends MyNavigatorEvent {
  const MyOnboardingEvent();

  @override
  List<Object> get props => [];
}

class MyHomePageOpenningEvent extends MyNavigatorEvent {
  const MyHomePageOpenningEvent();

  @override
  List<Object> get props => [];
}
