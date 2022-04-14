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
  HomepageFirst(this.memes);
  Memes memes;
  @override
  List<Object> get props => [0, memes];
}

class HomepageSeccond extends HomepageState {
  HomepageSeccond(this.memes);
  Memes memes;
  @override
  List<Object> get props => [1, memes];
}
