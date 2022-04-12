import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_navigator_event.dart';
part 'my_navigator_state.dart';

class MyNavigatorBloc extends Bloc<MyNavigatorEvent, MyNavigatorState> {
  MyNavigatorBloc() : super(MyNavigatorInitial()) {
    on<MyRegistrationButtonEvent>((event, emit) {
      emit(LoginPageState());
    });
    on<MyLoginButtonEvent>((event, emit) {
      emit(RegistrationPageState());
    });
    on<MyOnboardingEvent>((event, emit) {
      emit(RegistrationPageState());
    });
    on<MyHomePageOpenningEvent>((event, emit) {
      emit(HomePageState());
    });
  }
}
