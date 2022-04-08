import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Domain/usecase/auth/sign_up_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(this._signUpUsecase) : super(RegistrationInitialState()) {
    on<RegistrationPasswordChangedEvent>((event, emit) {
      _password = event.password;
      _passwordErrorText = _validatePassword(_password);

      if (_passwordErrorText.isEmpty && _mailErrorText.isEmpty) {
        emit(const RegistrationFormValidState());
      } else {
        _validateForm(
          emit: emit,
          passwordErrorText: _passwordErrorText,
          emailErrorText: _mailErrorText,
        );
      }
    });

    on<RegistrationEmailChangedEvent>((event, emit) {
      _email = event.email;
      _mailErrorText = _validateEmail(_email);

      if (_passwordErrorText.isEmpty && _mailErrorText.isEmpty) {
        emit(const RegistrationFormValidState());
      } else {
        _validateForm(
          emit: emit,
          passwordErrorText: _passwordErrorText,
          emailErrorText: _mailErrorText,
        );
      }
    });

    on<RegistrationFormSubmittedEvent>((event, emit) async {
      await _submitForm(emit: emit);
    });
  }

  final SignUpUsecase _signUpUsecase;

  String _email = ' ';
  String _mailErrorText = ' ';
  String _password = ' ';
  String _passwordErrorText = ' ';
  // final RegisterApiDataSource _registerApiDataSource = RegisterApiDataSource();

  String _validatePassword(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length >= 8) {
        return '';
      } else {
        return 'At least 8 characters needed.';
      }
    } else {
      return 'Passwor should not be empty';
    }
  }

  String _validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.contains('@')) {
        return '';
      } else {
        return 'This is not a correct email.';
      }
    } else {
      return 'Email should not be empty';
    }
  }

  void _validateForm({
    required Emitter emit,
    required String emailErrorText,
    required String passwordErrorText,
  }) {
    if (emailErrorText.isEmpty && passwordErrorText.isEmpty) {
      emit(RegistrationFormValidState());
    } else {
      emit(RegistrationFormInvalidState(
        emailErrorText: emailErrorText,
        passwordErrorText: passwordErrorText,
      ));
    }
  }

  Future<void> _submitForm({required Emitter emit}) async {
    try {
      emit(RegistrationLoadingState());

      final response = await _signUpUsecase(_email, _password);

      print(response.token);

      // if (response.statusCode == 200) {
      emit(const RegistrationSuccessState());
      // } else {
      //   emit(const RegistrationErrorState('Something wrong with form!'));
      // }
    } catch (error) {
      emit(const RegistrationErrorState('Registration failed!'));
    }
  }
}
