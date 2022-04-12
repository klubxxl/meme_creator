part of 'my_navigator_bloc.dart';

abstract class MyNavigatorState extends Equatable {
  const MyNavigatorState();

  @override
  List<Object> get props => [];
}

class MyNavigatorInitial extends MyNavigatorState {}

class RegistrationPageState extends MyNavigatorState {
  @override
  List<Object> get props => [];
}

class LoginPageState extends MyNavigatorState {
  @override
  List<Object> get props => [];
}

class OnboardingPageState extends MyNavigatorState {
  @override
  List<Object> get props => [];
}

class HomePageState extends MyNavigatorState {
  HomePageState(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}
