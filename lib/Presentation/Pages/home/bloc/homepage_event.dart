part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class ChangeIntoFirstScreenEvent extends HomepageEvent {
  const ChangeIntoFirstScreenEvent();

  @override
  List<Object> get props => [];
}

class ChangeIntoSeccondScreenEvent extends HomepageEvent {
  const ChangeIntoSeccondScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchMemesDataEvent extends HomepageEvent {
  const FetchMemesDataEvent();

  @override
  List<Object> get props => [];
}
