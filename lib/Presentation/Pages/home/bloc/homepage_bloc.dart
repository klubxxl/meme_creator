import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageFirst()) {
    on<ChangeIntoFirstScreenEvent>((event, emit) {
      print('hi');
      emit(HomepageFirst());
    });
    on<ChangeIntoSeccondScreenEvent>((event, emit) {
      emit(HomepageSeccond());
    });
    on<FetchMemesDataEvent>((event, emit) {
      try {
        emit(HomepageFirst());
      } catch (e) {
        emit(ErrorMemes());
      }
    });
  }
}
