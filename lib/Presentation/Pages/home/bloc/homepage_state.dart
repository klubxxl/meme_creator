part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  HomepageState();

  @override
  List<Object> get props => [];
}

class DownloadingMemes extends HomepageState {
  @override
  List<Object> get props => [0];
}

class ErrorMemes extends HomepageState {
  @override
  List<Object> get props => [0];
}

class HomepageFirst extends HomepageState {
  @override
  List<Object> get props => [0];
}

class HomepageSeccond extends HomepageState {
  @override
  List<Object> get props => [1];
}
