import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meme_creator/Data/auth/data_sources/auth_login_api_data_source.dart';
import 'package:meme_creator/Domain/usecase/auth/sign_in_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._signInUsecase) : super(LoginInitialState()) {
    on<LoginPasswordChangedEvent>((event, emit) {
      _password = event.password;
      _passwordErrorText = _validatePassword(_password);

      if (_passwordErrorText.isEmpty && _mailErrorText.isEmpty) {
        emit(LoginFormValidState());
      } else {
        _validateForm(
          emit: emit,
          passwordErrorText: _passwordErrorText,
          emailErrorText: _mailErrorText,
        );
      }
    });

    on<LoginEmailChangedEvent>((event, emit) {
      _email = event.email;
      _mailErrorText = _validateEmail(_email);

      if (_passwordErrorText.isEmpty && _mailErrorText.isEmpty) {
        emit(LoginFormValidState());
      } else {
        _validateForm(
          emit: emit,
          passwordErrorText: _passwordErrorText,
          emailErrorText: _mailErrorText,
        );
      }
    });

    on<LoginFormSubmittedEvent>((event, emit) async {
      await _submitForm(emit: emit);
    });
  }

  final SignInUsecase _signInUsecase;

  String _email = ' ';
  String _mailErrorText = ' ';
  String _password = ' ';
  String _passwordErrorText = ' ';
  final LoginApiDataSource _registerApiDataSource = LoginApiDataSource();

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
      emit(LoginFormValidState());
    } else {
      emit(LoginFormInvalidState(
        emailErrorText: emailErrorText,
        passwordErrorText: passwordErrorText,
      ));
    }
  }

  Future<void> _submitForm({required Emitter emit}) async {
    try {
      emit(LoginLoadingState());

      final response = await _signInUsecase(_email, _password);

      print(response.userId);

      emit(const LoginSuccessState());
    } catch (error) {
      emit(const LoginErrorState('Registration failed!'));
    }
  }
}
